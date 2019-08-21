using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClassRegistrations.Models
{
    public class Student
    {
        //Can be replaced with Invisible Auto Property fields
        private int _StudentID;
        private string _StudentName;
        private string _StudentEmail;
        private string _StudentLogin;
        private string _StudentPassword;

        //Constructor
        public Student(int StudentID, string StudentName, string StudentEmail, string StudentLogin, string StudentPassword)
        {
            this.StudentID = StudentID;
            this.StudentName = StudentName;
            this.StudentEmail = StudentEmail;
            this.StudentLogin = StudentLogin;
            this.StudentPassword = StudentPassword;
        }

        //Newer Expression Bodied Members Syntax C# 7+ (not used for properties with complex code requirements such as validation)
        //https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/statements-expressions-operators/expression-bodied-members
        public int StudentID { get => _StudentID; set => _StudentID = value; }
        public string StudentName { get => _StudentName; set => _StudentName = value; }
        public string StudentEmail { get => _StudentEmail; set => _StudentEmail = value; }
        public string StudentLogin { get => _StudentLogin; set => _StudentLogin = value; }
        public string StudentPassword { get => _StudentPassword; set => _StudentPassword = value; }
    }
}