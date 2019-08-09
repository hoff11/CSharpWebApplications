using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectUI.Models
{
    public class StudentModel
    {
        public int StudentId { get; set; }
        public string StudentFirstName { get; set; }
        public string StudentLastName { get; set; }
        public string StudentEmailAddress { get; set; }
        public string StudentConfirmEmailAddress { get; set; }
        public string StudentPassword { get; set; }
        public string StudentConfirmPassword { get; set; }
    }
}