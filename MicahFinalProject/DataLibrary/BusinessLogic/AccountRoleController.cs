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
            int success = DapperSqlHelper.ExecuteQuery("spNew_AccountRole", parameters);
            return success;
        }
        public static int DeleteUserRole(string userID, string roleName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "AccountID", ParameterValue = userID });
            parameters.Add(new ParameterInfo() { ParameterName = "RoleName", ParameterValue = roleName });
            int success = DapperSqlHelper.ExecuteQuery("DeleteAccountRole", parameters);
            return success;
        }
        public static IList<string> GetUserRoles(string userID)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "AccountID", ParameterValue = userID });
            IList<string> roles = DapperSqlHelper.GetRecords<string>("spGet_AccountRole", parameters);
            return roles;
        }
        public static IList<StudentModel> GetAccountByRole(int roleID)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "RoleId", ParameterValue = roleID });
            IList<StudentModel> accounts = DapperSqlHelper.GetRecords<StudentModel>("spGet_AccountByRole", parameters);
            return accounts;
        }
        public static AccountInfo GetUserByUsername(string userName)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "UserName", ParameterValue = userName });
            AccountInfo oUser = DapperSqlHelper.GetRecord<AccountInfo>("spGet_AccountByUserName", parameters);
            return oUser;
        }
    }
}
