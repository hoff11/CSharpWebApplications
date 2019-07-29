<%@ Page Title="Demo 03" Language="C#" MasterPageFile="~/Lesson06Site.Master" trace="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script runat="server">

[Serializable] //Added This!
class Person
{
    //
    public string FirstName;
    public string LastName;

    public Person(string FirstName, string LastName)
    {
        this.FirstName = FirstName;
        this.LastName = LastName;
    }
}

protected void Page_Load()
{   //Create and persist an object on the First Page request!
    if (!IsPostBack)
    {
        ViewState["objP"] = new Person("Bob", "Smith");
    }
}

protected void Button1_Click(object sender, EventArgs e)
{
    //I can create a Person Sever object by de-serializing it
    Person person = (Person)ViewState["objP"];
    
    Response.Write("<span>");
    if (TextBox1.Text != null)
    {
        // ASP.NET automatically tracks some state data in its 
        // control objects IMPLICITLY using the ViewState collection!
        // examples are label or textbox text...
        Label1.Text = TextBox1.Text + " | " + TextBox1.ForeColor.ToString();

        // However you can store data in the ViewState collection EXPLICITLY as well
        ViewState["T1"] = TextBox1.Text;
        Response.Write("<br/>Here is the ViewState Data: " + (string)ViewState["T1"]);

        //ViewState is a loosely typed collection and contains objects not just text!
        ViewState["T1Color"] = TextBox1.ForeColor;//ForeColor is an object not a string
        Response.Write("<br/>Here is the ViewState Data: " + ViewState["T1Color"]);

    }// end if

    Response.Write("<span><hr/>");

    //However an object must be Serialize-able before it can be placed in the ViewState
    //This causes an error, try it! --->  ViewState["objT1"] = TextBox1; 
    //This will not, because we used the [Serializable] attribute!    
    Label2.Text = person.FirstName + "," + person.LastName; //ASP.NET way of sending back data   
    Response.Write("<span style='color:blue;'>Show it's an Object: " + person.ToString());
    Response.Write("</span>");        
}
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Note that we use the ID attribute to get data and not the NAME!-->
    <asp:TextBox ID="TextBox1" runat="server" Text="ABC" ForeColor="#FF0000"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="Button"  OnClick="Button1_Click"/><br />
    <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
</asp:Content>
