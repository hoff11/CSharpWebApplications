<%@ Page Title="Demo 06" Language="C#"  %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lesson06 Demos</title>
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

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>