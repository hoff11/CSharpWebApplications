using DataLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinsessLogic
{
    public static class UserProcessor
    {
        public static int CreateUser(string firstName, string lastName, string email)
        {
            UserModel data = new UserModel
            {
                FirstName = firstName,
                LastName = lastName,
                EmailAddress = email
            };

            string sql = @"insert into dbo.[User] (FirstName, LastName, EmailAddress) values (@FirstName, @LastName, @EmailAddress)";

            return SqlDataAccess.SaveData(sql, data);
        }

        public static List<UserModel> LoadUsers()
        {
            string sql = @"select Id, FirstName, LastName, EmailAddress
                            from dbo.[User]";

            return SqlDataAccess.LoadData<UserModel>(sql);
        }
    }
}
