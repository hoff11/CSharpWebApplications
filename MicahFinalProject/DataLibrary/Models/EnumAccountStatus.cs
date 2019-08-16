using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataLibrary.Models
{
    public enum EnumAccountStatus
    {
        Pending = 0,
        Active,
        LockedOut,
        Closed,
        Banned
    } 
}