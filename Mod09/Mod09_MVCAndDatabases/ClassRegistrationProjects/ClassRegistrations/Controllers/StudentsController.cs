using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClassRegistrations.Controllers
{
    public class StudentsController : Controller
    {
        //Create a Data Processor object
        private ClassRegistrationProcessor.StudentProcessor objProcessor;
        private string strConnectionString;

        public StudentsController()
        {
            objProcessor = new ClassRegistrationProcessor.StudentProcessor();
            //strConnectionString = "Data Source=(local);Initial Catalog=AdvWebDevProject;Integrated Security=True";
            strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalPC"].ConnectionString;  
            strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UWSvr"].ConnectionString;             
        }

        private List<Models.Student> SelectAllStudents()
        {
            //You can return an object for View data using a class in the DLL,
            List<ClassRegistrationProcessor.Student> lstRows = objProcessor.Select(strConnectionString);

            //BUT you can also create an MVC data model, which decouples the requierment of a DLL (could switch to a XML or JSON file later!)
            Models.Student objStudent;
            List<Models.Student> lstStudents = new List<Models.Student>();
            foreach (var row in lstRows)
            {
                objStudent = new Models.Student(row.StudentID, row.StudentName, row.StudentEmail, row.StudentLogin, row.StudentPassword);
                lstStudents.Add(objStudent);
            }
            return lstStudents;
        }

        private Models.Student SelectOneStudents(int id)
        {
            var objOneStudent = new object();
            foreach (var item in SelectAllStudents())
            {
                if (item.StudentID == id) objOneStudent = item;
            }
            return (Models.Student)objOneStudent;
        }
        
        #region Select
        //GET: Students
        public ActionResult Index()
        {
            return View(SelectAllStudents()); //Send student list to the Razor page
        }


               // GET: Students/Details/5
        public ActionResult Details(int id)
        {
            return View(SelectOneStudents(id));
        }
        #endregion

        #region Insert
        // GET: Students/Create
        public ActionResult Create() //AKA Insert!
        {
            return View(); //Open a Razor page with textboxes to fill in new data
        }

        // POST: Students/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection) //catch the new data from the textboxes
        {
            ViewData["Error"] = ""; //You must declare this here, or it's "Conditonally" created in the Catch block
            try
            {
                // TODO: Add Insert logic here
                objProcessor.Insert(strConnectionString
                                  , int.Parse(collection["StudentID"])
                                  , collection["StudentName"]
                                  , collection["StudentEmail"]
                                  , collection["StudentLogin"]
                                  , collection["StudentPassword"]);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;
                return View();
            }
        }

        #endregion

        #region Update
        // GET: Students/Edit/5
        public ActionResult Edit(int id) //AKA Update
        {
            return View(SelectOneStudents(id));
        }

        // POST: Students/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            ViewData["Error"] = ""; //You must declare this here, or it's "Conditonally" created in the Catch block
            try
            {

                // TODO: Add Insert logic here
                objProcessor.Update(strConnectionString
                                  , int.Parse(collection["StudentID"])
                                  , collection["StudentName"]
                                  , collection["StudentEmail"]
                                  , collection["StudentLogin"]
                                  , collection["StudentPassword"]);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;
                return View();
            }
        }
        #endregion

        #region Delete
        // GET: Students/Delete/5
        public ActionResult Delete(int id)
        {
            return View(SelectOneStudents(id));
        }

        // POST: Students/Delete/5 
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            //You can always choose to keep you code simple like this example:
            ViewData["Error"] = "";
            try
            {
                objProcessor.Delete(strConnectionString, id);
                ViewData["StudentID"] = id;
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Error"] = ex.Message;
                return View();
            }
        }

        #endregion
    }
}
