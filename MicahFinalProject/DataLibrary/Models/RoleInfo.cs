using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataLibrary.Models
{
    public class RoleInfo : IRole
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
}