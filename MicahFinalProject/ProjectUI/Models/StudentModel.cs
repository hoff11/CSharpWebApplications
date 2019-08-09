using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectUI.Models
{
    public class StudentModel
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "You need to provide your first name.")]
        public string StudentFirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "You need to provide your last name.")]
        public string StudentLastName { get; set; }

        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email Address")]
        [Required(ErrorMessage = "You need to provide your email address.")]
        public string StudentEmailAddress { get; set; }

        [Display(Name = "Confirm Email")]
        [Compare("StudentEmailAddress", ErrorMessage = "The email and confirm email must match.")]
        public string StudentConfirmEmailAddress { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "You must provide a password")]
        [DataType(DataType.Password)]
        [StringLength(100, MinimumLength = 10, ErrorMessage = "You need to provide a long enough password")]
        public string StudentPassword { get; set; }

        [Display(Name = "Confirm Password")]
        [Compare("StudentPassword", ErrorMessage = "Your password and confirm password do not match.")]
        public string StudentConfirmPassword { get; set; }
    }
}