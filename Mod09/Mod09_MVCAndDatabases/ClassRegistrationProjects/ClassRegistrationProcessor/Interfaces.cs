

using System.Collections.Generic;

namespace ClassRegistrationProcessor
{
    // Entities
    public interface iStudent
    {
        int StudentID { get; set; }
        string StudentName { get; set; }
        string StudentEmail { get; set; }
        string StudentLogin { get; set; }
        string StudentPassword { get; set; }
    }

    //Processors
    public interface iStudentProcessor
    {
        List<Student> Select(string Connection);
        int Insert(string Connection, int StudentID, string StudentName, string StudentEmail, string StudentLogin, string StudentPassword);
        int Update(string Connection, int StudentID, string StudentName, string StudentEmail, string StudentLogin, string StudentPassword); 
        int Delete(string Connection, int StudentID);     
    }
}
