<%@ Page Title="Demo02" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        class Person
        {
            public string FirstName;
            public Person(string FirstName)
            {
                this.FirstName = FirstName;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //You can send an Object's State as a string 
            Person objP = new Person("Bob");

            //Traditional way of sending back data          
            Response.Write(objP.FirstName + "<hr/>");

            //ASP.NET way of sending back data    
            Label1.Text = objP.FirstName;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
