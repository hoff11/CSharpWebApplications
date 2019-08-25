using ProjectUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLibrary;
using DataLibrary.BusinessLogic;

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


        #region deprecated
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
                //call business logic
                int recordsCreated = StudentProcessor_notused.CreateStudent(studentmodel.Email, studentmodel.UserName);

                return RedirectToAction("Index");
            }
            return View();
        }
        public ActionResult MyClasses()
        {
            ViewBag.Message = "My Class List";
            var data = StudentProcessor_notused.LoadClassesForStudent(1);
            List<ClassesModel> myclasses = new List<ClassesModel>();

            foreach (var row in data)
            {
                myclasses.Add(new ClassesModel
                {
                    ClassId = row.ClassId,
                    ClassName = row.ClassName,
                    ClassDate = row.ClassDate,
                    ClassDescription = row.ClassDescription
                });
            }
            return View(myclasses);
        }
        #endregion
    }
}