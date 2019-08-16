using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public class SignInManager
    {
        public enum SignInStatus
        {
            Success = 0,
            Failure = 1
        }
        //public Task<SignInStatus> PasswordSignInAysnc(string userName, string password)
        //{
        //    var result = await SqlDataAccess.LoadData
        //    return SignInStatus.Success;
        //}
    }
}
