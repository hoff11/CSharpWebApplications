using DataLibrary.BusinessLogic;
using ProjectUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectUI.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewStudents()
        {
            ViewBag.Message = "Student List";

            //list of datalibrary model
            var data = AccountRoleController.GetAccountByRole("student");
            //ui model
            List<StudentModel> students = new List<StudentModel>();
            //convert datalibrary model to ui model
            foreach (var row in data)
            {
                students.Add(new StudentModel
                {
                    UserName = row.UserName,
                    Email = row.Email
                });
            }

            return View(students);
        }
    }
}