<%@ Page Title="Demo 07" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--Reference the code JQuery 
        and an Add-On for cookies  https://github.com/carhartl/jquery-cookie --%>
    <script src="Scripts/jquery-1.11.1.js"></script>
    <script src="Scripts/jquery.cookie.js"></script>
    <script>
        //JQuery makes using Cookies easy! (compared to this: 
        // http://www.w3schools.com/js/tryit.asp?filename=tryjs_cookie_username)
        $(document).ready(function () {

            $('#ContentPlaceHolder1_Button1').click(function () {
                if ($.cookie("FirstName") == null) {
                    //Set a cookie
                    $.cookie("FirstName", "Bob", { expires: 10 });
                    alert("Cookie set");
                } else { //Get a cookie
                    alert("Cookie value is " + $.cookie("FirstName"));
                }
            })//end Button1.Click

            $('#ContentPlaceHolder1_Button2').click(function () {
                if ($.cookie("FirstName") != null) {
                    //Delete the cookie
                    $.removeCookie("FirstName");
                }//end Button2.Click
            })//end Button1.Click

        });//End ready
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Set or Read Button"/><br />
    <asp:Button ID="Button2" runat="server" Text="Delete Button"/><br />
</asp:Content>
