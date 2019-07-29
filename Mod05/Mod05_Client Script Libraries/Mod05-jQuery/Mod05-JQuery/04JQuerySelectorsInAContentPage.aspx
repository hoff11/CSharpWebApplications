<%@ Page Title="03" Language="C#" MasterPageFile="~/Lesson5Site.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="Scripts/jQuery-3.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function () {
// This Anonymous function will fire once the document has 
//completed loading in the Browser and is "READY."

    $("#Button1").click(function () {

        //This is using the standard jQuery name (Does Not Work!)
        $("#Label1").html("Standard jQuery name does NOT work!");

        // In a Content page you can use the following syntax to access the objects.
        //This is using the Content Place Holder's Name + the Control's ID syntax (Does Work!)
        $("#ContentPlaceHolder1_Label2").html("Standard JavaScript syntax DOES work!");
                
        // Here is another example of, where the name is accessed using the ClientID property
        //it's using Response.write shorthand code %= to get the labels name
        $("#<%=Label3.ClientID%>").html("Using the ASP.NET ClientID property DOES works!");
    });

});
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <h1>Click on the labels and the button to demonstrate how the events functions run...</h1>
    <asp:Label ID="Label1" runat="server" Text="Original Text for Label1"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Original Text for Label2"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Original Text for Label3"></asp:Label>
    <br />
    <input id="Button1" type="button" value="button" />
</div>
</asp:Content>
