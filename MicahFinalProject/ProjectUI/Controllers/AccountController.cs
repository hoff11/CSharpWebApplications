using DataLibrary.BusinessLogic;
using DataLibrary.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using ProjectUI.App_Start;
using ProjectUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ProjectUI.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        public ActionResult Logout()
        {
            SignInManager.AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

        // GET: Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginModel objLogin, string returnUrl)
        {
            if (ModelState.IsValid)
            {

                //account - loginmodel
                ApplicationUser oUser = await SignInManager.UserManager.FindByNameAsync(objLogin.Email);
                if (oUser != null && oUser.Password == objLogin.Password)
                {
                    switch (oUser.Status)
                    {
                        case EnumAccountStatus.Pending:
                            ModelState.AddModelError("", "Error: User account has not been verified.");
                            break;
                        case EnumAccountStatus.Active:
                            SignInManager.SignIn(oUser, false, false);
                            IList<string> roleList = AccountRoleController.GetUserRoles(oUser.Id);
                            foreach (string role in roleList)
                            {
                                UserManager.AddToRole(oUser.Id, role);
                            }

                            //if no return url provided then redirect page based on role
                            if (string.IsNullOrEmpty(returnUrl))
                            {
                                if (roleList.IndexOf("Administrator") >= 0)
                                {
                                    return RedirectToAction("Index", "Admin");
                                }
                                else
                                {
                                    return RedirectToAction("Index", "student");
                                }
                            }
                            return RedirectToLocal(returnUrl);

                        case EnumAccountStatus.Banned:
                            ModelState.AddModelError("", "Error: User account has been banned.");
                            break;
                        case EnumAccountStatus.LockedOut:
                            ModelState.AddModelError("", "Error: User account has been locked out due to multiple login tries.");
                            break;
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Error: Invalid login details.");
                }
            }
            return View(objLogin);
        }

        #region Helpers
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, "Error");
            }
        }
        #endregion
    }
}