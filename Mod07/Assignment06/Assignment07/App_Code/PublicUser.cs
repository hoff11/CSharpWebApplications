using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment07.App_Code
{
    [Serializable]
    public class PublicUser
    {
        public string FirstName, LastName;
        public PublicUser(string FirstName, string LastName)
        { this.FirstName = FirstName; this.LastName = LastName; }//end Constructor
    }//End Class
}