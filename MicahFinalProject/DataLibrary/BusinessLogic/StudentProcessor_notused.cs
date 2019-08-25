using DataLibrary.DataAccess;
using DataLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region deprecated
namespace DataLibrary.BusinessLogic
{
    public static class StudentProcessor_notused
    {
        public static int CreateStudent(string studentEmailAddres, string studentUserName)
        {
            //map front end model to data library model
            StudentModel studentdata = new StudentModel
            {
                UserName = studentUserName,                
                Email = studentEmailAddres
            };

            string sql = @"insert into dbo.StudentTable (StudentFirstName, StudentLastName, StudentEmailAddress) values (@StudentFirstName, @StudentLastName, @StudentEmailAddress)";
            //return data of type T
            return SqlDataAccess_notused.SaveData(sql, studentdata);
        }

        public static List<StudentModel> LoadStudents()
        {
            string sql = @"select StudentFirstName, StudentLastName, StudentEmailAddress
                            from dbo.StudentTable;";
            //loading full model
            //not parameterized
            return SqlDataAccess_notused.LoadData<StudentModel>(sql);
        }

        public static List<ClassesModel> LoadClassesForStudent(int id)
        {
            string sql = "dbo.pSelClassesByStudentId @StudentId";
            int param = id;
            return SqlDataAccess_notused.LoadDataStudentClasses<ClassesModel>(sql, param);
        }
    }
}
#endregion