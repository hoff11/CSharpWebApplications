using System;

namespace Lesson06ManagingStateData
{
    [Serializable]
    public class GlobalPerson
    {
        public string FirstName, LastName;
        public GlobalPerson(string FirstName, string LastName)
        { this.FirstName = FirstName; this.LastName = LastName; }//end Constructor
    }//End Class
}