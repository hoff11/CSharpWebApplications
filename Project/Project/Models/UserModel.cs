using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectUI.Models
{
    public class UserModel
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "You need to provide a first name.")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "You need to provide a last name.")]
        public string LastName { get; set; }

        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        [Required(ErrorMessage = "You need to provide a valid email.")]        
        public string EmailAddress { get; set; }

        [DataType(DataType.EmailAddress)]
        [Display(Name = "Confirm Email")]
        [Compare("EmailAddress", ErrorMessage = "The emails must match.")]
        public string ConfirmEmail { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "You must have a password.")]
        [DataType(DataType.Password)]
        [StringLength(100,MinimumLength = 10, ErrorMessage = "You need to provide a long enough password.")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Compare("Password",ErrorMessage = "Your password and confirm password must match.")]
        public string ConfirmPassword { get; set; }
        
    }
}