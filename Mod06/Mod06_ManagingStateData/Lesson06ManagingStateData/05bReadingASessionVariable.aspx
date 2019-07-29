<%@ Page Title="Demo 05" Language="C#" MasterPageFile="~/Lesson06Site.Master" Trace="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["objP"] == null) //if no session variable...
            { Response.Redirect("05aSessonVariables.aspx"); } //..go back to the first page!
            else
            { this.Label1.Text = ((Lesson06ManagingStateData.GlobalPerson)Session["objP"]).FirstName; }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();//This deletes the session variable from the server
        }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Log Out!" OnClick="Button1_Click" />
</asp:Content>
