using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class AccountController
    {
        public static int NewUser(ApplicationUser objUser)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Id", ParameterValue = objUser.Id });
            parameters.Add(new ParameterInfo() { ParameterName = "AccountName", ParameterValue = objUser.UserName });
            parameters.Add(new ParameterInfo() { ParameterName = "Email", ParameterValue = objUser.Email });
            parameters.Add(new ParameterInfo() { ParameterName = "Password", ParameterValue = objUser.Password });
            parameters.Add(new ParameterInfo() { ParameterName = "Status", ParameterValue = objUser.Status });
            int success = DapperSqlHelper.ExecuteQuery("NewAccount", parameters);
            return success;
        }

        public static int DeleteUser(ApplicationUser objUser)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Id", ParameterValue = objUser.Id });
            int success = DapperSqlHelper.ExecuteQuery("DeleteAccount", parameters);
            return success;
        }

        public static ApplicationUser GetUser(string id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Id", ParameterValue = id });
            ApplicationUser oUser = DapperSqlHelper.GetRecord<ApplicationUser>("GetAccount", parameters);
            return oUser;
        }

        public static ApplicationUser GetUserByUsername(string userName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Email", ParameterValue = userName });
            ApplicationUser oUser = DapperSqlHelper.GetRecord<ApplicationUser>("GetAccountByEmail", parameters);
            return oUser;
        }

        public static int UpdateUser(ApplicationUser objUser)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Email", ParameterValue = objUser.Email });
            int success = DapperSqlHelper.ExecuteQuery("UpdateAccount", parameters);
            return success;
        }
    }
}
