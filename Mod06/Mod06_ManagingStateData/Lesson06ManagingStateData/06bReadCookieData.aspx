<%@ Page Title="Demo 06" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            HttpCookie arrOfCookieData = Request.Cookies["myCookieCollectionName"];
            Label1.Text = "Stored Data: " + arrOfCookieData["ClickTime"];
        }
        catch (Exception ex)
        {
            Label1.Text = ex.ToString();
        }
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
