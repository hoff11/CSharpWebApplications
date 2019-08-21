using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClassRegistrations.Controllers
{
public class SimpleStudentsController : Controller
{
// GET: SimpleStudents
public ActionResult Index()
{
    List<Models.Student> Students = new List<Models.Student>();
    string strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UWSvr"].ConnectionString;
    try
    {
        string strCmd = @"Select StudentID, StudentName, StudentEmail, StudentLogin, StudentPassword From vStudents;";
        SqlConnection objCon = new SqlConnection(strConnectionString);
        SqlCommand objCmd = new SqlCommand(strCmd, objCon);
        objCon.Open();
        System.Data.IDataReader objDR = objCmd.ExecuteReader();

        while (objDR.Read())
        {
            Models.Student objRow = new Models.Student((int)objDR["StudentID"]
                                        , (string)objDR["StudentName"]
                                        , (string)objDR["StudentEmail"]
                                        , (string)objDR["StudentLogin"]
                                        , (string)objDR["StudentPassword"]);
            Students.Add(objRow);
        }
        objCon.Close();
    }
    catch (Exception)
    {
        throw;
    }
    return View(Students);
}

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
    string strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UWSvr"].ConnectionString;

    ClassRegistrations.App_Code.LocalProcessor objProcessor; // Make sure to change class's Build Action Property to Compile!
    objProcessor = new App_Code.LocalProcessor();
    // https://amitpatriwala.wordpress.com/2017/07/06/class-file-in-app_code-folder-not-working-asp-net-mvc/
            
    ViewData["Error"] = ""; //You must declare this here, or it's "Conditonally" created in the Catch block
    try
    {
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
}
}