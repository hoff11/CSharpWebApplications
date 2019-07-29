<%@ Page Title="Demo 07" Language="C#" MasterPageFile="~/Lesson06Site.Master" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = HiddenField1.Value;
    }   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function ClientCodeButton_Click() {

            var strFirstName = document.getElementById("ContentPlaceHolder1_TextBox1").value;

            var JSONPersons = '{"Person":[' //Start an unordered set named Persons
            + '{"FirstName":"Bob" },' // Add a static Name:Value pair
            + '{"FirstName":"' + strFirstName + '" }' // Or add a dynamic Name:Value pair
            + ']}';

            //JSON only holds data and cannot include Methods"
            // Person.prototype.GetData = function () { return this.FirstName };

            //For more details see: http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf

            //Let's get a reference to Lable1
            var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");

            //Now let's Object with the JSONPerson string!
            //JSON.parse(text) converts JSON text into a JavaScript object
            var P1 = JSON.parse(JSONPersons);
            for (var i = 0; i < P1.Person.length; i++) {
                objLabel1.innerHTML += P1.Person[i].FirstName + ',';
            }

            // Let's store the current data after each button click!
            document.getElementById("ContentPlaceHolder1_HiddenField1").value = objLabel1.innerHTML;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Using a Hidden Field to hold the Label1's data between PostBacks --%>
    <asp:HiddenField ID="HiddenField1" runat="server" />

    <asp:Button ID="Button1" runat="server" Text="Button"
        AutoPostBack="false"
        OnClientClick="ClientCodeButton_Click()" /><br />

    <asp:TextBox ID="TextBox1" runat="server" Text="Sue"></asp:TextBox><br />
    <asp:Label ID="Label1" runat="server" Text="Label" />
</asp:Content>


