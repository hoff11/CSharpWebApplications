<%@ Page Title="Demo 06" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = HiddenField1.Value;
    }   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //I will use this script block is for defining My JavaScript Objects

        //The Anonymous function acts as the constructor for "Class" Person!
        var Person = function (FirstName) {
            this.FirstName = FirstName; //This is a JavaScript field;
        };//End of Person "Class" Constructor 
        
        //You add methods by Extending the "Class"
        Person.prototype.GetData = function () { return this.FirstName };

        //For more details see: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript
    </script>

    <script  type="text/javascript">
        //I will use this script block is for my Event Handling
        function ClientCodeButton_Click() {
            //Let's get a reference to Lable1
            var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");

            //Now let's work with the Person Object!
            var P1 = new Person("Bob", "Smith"); //Use its constructor
            objLabel1.innerHTML = P1.GetData(); //Use its method

            // We'll place the Label's state data of the into a 
            // Hidden Field before it goes to the web server. 
            // Otherwise the state data is lost!
            alert("Pause before trip to the server!");
            document.getElementById("ContentPlaceHolder1_HiddenField1").value = objLabel1.innerHTML;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Button"
        AutoPostBack="false"
        OnClientClick="ClientCodeButton_Click()" /><br />

    <asp:Label ID="Label1" runat="server" Text="Label" />
    <%-- Use a Hidden Field to hold the Label1's data between PostBacks --%>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>


