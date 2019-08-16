using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectUI.Controllers
{
    [Authorize(Roles = "Administrator , Student")]
    public class StudentController : Controller
    {
        // GET: Member
        public ActionResult Index()
        {
            return View();
        }
    }
}