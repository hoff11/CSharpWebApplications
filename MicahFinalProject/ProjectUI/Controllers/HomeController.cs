using ProjectUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectUI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        //basic get view
        public ActionResult SignUp()
        {
            ViewBag.Message = "Student Sign Up Page.";
            return View();
        }
        //send data from the form to this method
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp(StudentModel studentmodel)
        {
            if (ModelState.IsValid) //does comply with all of model rules, back end check incase front end fooled.  
            {
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}