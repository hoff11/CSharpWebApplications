using Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static DataLibrary.BusinsessLogic.UserProcessor;

namespace Project.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewUsers()
        {
            ViewBag.Message = "User List";

            var data = LoadUsers();
            List<UserModel> users = new List<UserModel>();
            foreach (var row in data)
            {
                users.Add(new UserModel
                {
                    FirstName = row.FirstName,
                    LastName = row.LastName,
                    EmailAddress = row.EmailAddress,
                    ConfirmEmail = row.EmailAddress
                });
            }

            return View(users);
        }
        public ActionResult SignUp()
        {
            ViewBag.Message = "User Sign Up";

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp(UserModel model)
        {
            if (ModelState.IsValid)
            {
                int recordsCreated = CreateUser(model.FirstName,
                    model.LastName,
                    model.EmailAddress);
                return RedirectToAction("ViewUsers", "User");
            }

            return View();
        }
    }
}