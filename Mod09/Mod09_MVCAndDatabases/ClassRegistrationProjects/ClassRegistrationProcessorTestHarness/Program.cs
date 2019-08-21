using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassRegistrationProcessorTestHarness
{
class Program
{
    static void Main(string[] args)
    {
        string strCon = "Data Source=.;Initial Catalog=AdvWebDevProject;Integrated Security=True";

        ClassRegistrationProcessor.StudentProcessor objSP;
        objSP = new ClassRegistrationProcessor.StudentProcessor();
        List<ClassRegistrationProcessor.Student> objStudents;
        int intRC; 

        Console.WriteLine("Select Test");
        objStudents = objSP.Select(strCon);
        foreach (var item in objStudents) Console.WriteLine(item.ToString());
        Console.WriteLine("\n\r");

        Console.WriteLine("Insert Test");
        intRC = objSP.Insert(strCon, 3, "Test I", "Test I", "Test I", "Test I");
        Console.WriteLine(intRC);
        objStudents = objSP.Select(strCon);
        foreach (var item in objStudents) Console.WriteLine(item.ToString());
        Console.WriteLine("\n\r");

        Console.WriteLine("Update Test");
        intRC = objSP.Update(strCon, 3, "Test U", "Test U", "Test U", "Test U");
        Console.WriteLine(intRC);
        objStudents = objSP.Select(strCon);
        foreach (var item in objStudents) Console.WriteLine(item.ToString());
        Console.WriteLine("\n\r");

        Console.WriteLine("Delete Test");
        intRC = objSP.Delete(strCon, 3);
        Console.WriteLine(intRC);
        foreach (var item in objStudents) Console.WriteLine(item.ToString());
        Console.WriteLine("\n\r");

        Console.ReadLine();//Pause
    }
}
}
