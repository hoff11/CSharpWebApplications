using DataLibrary.DataAccess;
using DataLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class AccountRoleController
    {
        public static int NewUserRole(string userID, string roleName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "AccountID", ParameterValue = userID });
            parameters.Add(new ParameterInfo() { ParameterName = "RoleName", ParameterValue = roleName });
            int success = DapperSqlHelper.ExecuteQuery("NewUserRole", parameters);
            return success;
        }

        public static int DeleteUserRole(string userID, string roleName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "AccountID", ParameterValue = userID });
            parameters.Add(new ParameterInfo() { ParameterName = "RoleName", ParameterValue = roleName });
            int success = DapperSqlHelper.ExecuteQuery("DeleteUserRole", parameters);
            return success;
        }

        public static IList<string> GetUserRoles(string userID)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "AccountID", ParameterValue = userID });
            IList<string> roles = DapperSqlHelper.GetRecords<string>("GetUserRoles", parameters);
            return roles;
        }

        public static AccountInfo GetUserByUsername(string userName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Accountname", ParameterValue = userName });
            AccountInfo oUser = DapperSqlHelper.GetRecord<AccountInfo>("GetUserByUsername", parameters);
            return oUser;
        }
    }
}
