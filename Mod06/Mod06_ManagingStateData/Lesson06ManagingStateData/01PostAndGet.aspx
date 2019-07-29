<%@ Page Title="ASPX Demo01" Language="C#" MasterPageFile="~/Lesson06Site.Master" Trace="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%= "<hr/> This page processes input data" %>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<span>");
            if (Request.Form["Text1"] != null)
            { 
                Response.Write("Here is the Post Data: " + Request.Form["Text1"]); //olde ASP way
                Label1.Text = "Post Data in Label: " + Request.Form["Text1"];  //ASP.Net way              
            }
            else if (Request.QueryString["Text2"] != null)
            { 
                Response.Write("Here is the Get Data: " + Request.QueryString["Text2"]);
                Label1.Text =  "QueryString Data in Label: " + Request.QueryString["Text2"];
            }
            Response.Write("</span>");   
        }        
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <hr />
    <p>Browse Run HTML Page First:&nbsp; 
    <a href="01HtmlPage.html">01HtmlPage.html</a>
    </p>
</asp:Content>
