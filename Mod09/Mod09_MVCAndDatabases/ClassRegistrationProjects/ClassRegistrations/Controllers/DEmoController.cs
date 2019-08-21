using System.Collections.Generic;
using System.Web.Mvc;

namespace ClassRegistrations.Controllers
{
public class DemoController : Controller
{
    //Create a Data Processor object
    private ClassRegistrationProcessor.StudentProcessor objProcessor;
    private string strConnectionString;

    public DemoController()
    {
        objProcessor = new ClassRegistrationProcessor.StudentProcessor();
        strConnectionString = "Data Source=(local);Initial Catalog=AdvWebDevProject;Integrated Security=True";
    }

    private List<ClassRegistrationProcessor.Student> SelectAllStudents()
    {     
        return objProcessor.Select(strConnectionString);
    }

    private ClassRegistrationProcessor.Student SelectOneStudents(int id)
    {
        var objOneStudent = new object();
        foreach (var item in SelectAllStudents())
        {
            if (item.StudentID == id) objOneStudent = item;
        }
        return (ClassRegistrationProcessor.Student)objOneStudent;
    }

    // GET: DEmo
    public ActionResult Index()
    {
        return View(SelectOneStudents(1));
    }
}
}