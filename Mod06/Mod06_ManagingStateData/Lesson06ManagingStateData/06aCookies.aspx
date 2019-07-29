<%@ Page Title="Demo 06" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
            Response.Write("Current Time" + DateTime.Now + "<p/>");
            HttpCookie myCookie = Request.Cookies["myCookieCollectionName"];
            if (myCookie != null)
            {
                //Cookie variables are stored as strings.
                HttpCookie arrOfCookieData = Request.Cookies["myCookieCollectionName"];
                Label1.Text = "Stored Data: " + arrOfCookieData["ClickTime"];
            }
            else
            {
                Label1.Text = "<p/>" + "No Cookie found!";
            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["myCookieCollectionName"] == null)
        {
            //Create a cookie object
            HttpCookie arrOfCookieData = new HttpCookie("myCookieCollectionName");

            //Configure the cookie
            //Set the Web Browser to delete the cookie in 10 seconds
            arrOfCookieData.Expires = DateTime.Now.AddSeconds(10);
            arrOfCookieData["ClickTime"] = DateTime.Now.ToString();

            //Send the request for a cookie to the Web Browser
            Response.Cookies.Add(arrOfCookieData);
            Label1.Text = "<br/>" + "Cooking in memory for 10 seconds";
            Label1.Text +=  "<br/>" + "Press the button again to see the data";        
        }
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <p> Notes: <br />
        The data is SAVED in the cookie even if the browser is closed or a new Tab is opened. <br />
        Cookies work across web pages in the same site 
        (<a href="06bReadCookieData.aspx">06bReadCookieData.aspx</a>). <br />
        or even on Other Web Sites on the Same Server        
        (<a href="http://localhost:8888/06bReadCookieData.aspx">Other Web Site</a>). <br />        
    </p>
</asp:Content>
