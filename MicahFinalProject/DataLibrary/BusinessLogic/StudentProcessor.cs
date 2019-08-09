using DataLibrary.DataAccess;
using DataLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class StudentProcessor
    {
        public static int CreateStudent(string studentFirstName, string studentLastName, string studentEmailAddress)
        {
            //map front end model to data library model
            StudentModel studentdata = new StudentModel
            {
                StudentFirstName = studentFirstName,
                StudentLastName = studentLastName,
                StudentEmailAddress = studentEmailAddress
            };

            string sql = @"insert into dbo.StudentTable (StudentFirstName, StudentLastName, StudentEmailAddress) values (@StudentFirstName, @StudentLastName, @StudentEmailAddress)";
            //return data of type T
            return SqlDataAccess.SaveData(sql, studentdata);
        }

        public static List<StudentModel> LoadStudents()
        {
            string sql = @"select, StudentFirstName, StudentLastName, StudentEmailAddress
                            from dbo.StudentTable;";
            //loading full model
            //not parameterized
            return SqlDataAccess.LoadData<StudentModel>(sql);
        }
    }
}
