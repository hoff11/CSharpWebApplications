using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication11.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection collection) //catch the new data from the textboxes
        {
            WebApplication11.Models.MyDefaulPageData objData = new WebApplication11.Models.MyDefaulPageData();
            objData.TextData = collection["TextData"];
            objData.HiddenData = collection["HiddenData"];            
         return View(objData);
        }
    }
}