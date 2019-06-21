using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Student
{
    public string FirstName { get; set; }
    public string LastName { get; set; }

    public string GetHtml()
    {
        string htmlString;
        htmlString = "<br/><h1>" + FirstName + " " + LastName + "</h1><br>";
        return htmlString;
    }

    public Student(string firstName, string lastName)
    {
        FirstName = firstName;
        LastName = lastName;
    }


}
