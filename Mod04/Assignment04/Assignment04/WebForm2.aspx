<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Demo 03</title>
<style type="text/css">
.SilverStyle {
    background-color: Silver;
}
</style>

<%--  This script block adds the JQuery reference, enabling access to all the JQuery functions and fields  --%>
<script src="Scripts/jquery-3.1.1.js" type="text/javascript"></script>

<%--  Note: You MUST use another, separate, script block for your personal code!!  --%>
<script type="text/javascript">
// This is a simple JavaScript function without parameters, but note that the PARENTHESES are STILL REQUIRED.
function MyClickEventMethod() { alert("You clicked a label 1"); }

// This is another JavaScript function with a parameter note that the value is an Object.
function MyClickEventMethodWithSimpleParams(MyMessage) { alert(MyMessage.data); }

// This is another JavaScript function with a parameter.
function MyClickEventMethodWithParams(MyEventData) {
    alert(MyEventData.data.SomeMessage);
    alert(MyEventData.data.AnotherMessage);
}

</script>
<%--  Note: You can use separate script blocks to organize your code as well --%>
<script type="text/javascript">
    $(document).ready(function () { // This Anonymous function will fire once the document has completed 
    //    loading in the Browser and is "READY."

    // You can map event handling using the [Selector].[Event] syntax as follows...
    // http://api.jquery.com/click/
    $("#Label1").click(MyClickEventMethod); // NOTE: We DON'T use Parentheses after the function name 
    //since MyClickEventMethod() has are no arguments.

    //Here we are passing an argument the MyClickEventMethodWithSimpleParams function and do use Parentheses.
    $("#Label2").click("A Simple Message", MyClickEventMethodWithSimpleParams);

    //Here we are passing an argument the MyClickEventMethodWithParams function and do NOT use Parentheses.
    $("#Label3").click({ SomeMessage: "Randal's Data from Argument", AnotherMessage: "More Data" }, MyClickEventMethodWithParams);
    // ---------- Note: The Name : Value pair are contained in a set of braces creating an anonymous type (with name and value pairs)
    // These are typed before the method's name, but will be used by the function MyClickEventMethodWithParams automatically----

    //Here we create an anonymous function to handle a click event  
    //***(And yes, it is an anonymous JS Function inside of another anonymous JS Function!)***
    $("#Label4").click(function () {
        $('#Span1').text("New Text for span1");// .text() is a JQuery function used to access the innerHTML text of a element
        // Since .text() is a JQuery function, as compared to your own Personal function, you change the text of a 
        //DOM element like this[Function]([Argument])!
        $('#Label4').text("New Text for Label3");
    })

    $("#HTMLButton").click(function () {   
        // You use the following [Selector].[Property] syntax to access a browser's Document Object Model (DOM) objects with JQuery.
        // Here are three common ways to $elect an element in a Browser's DOM. (http://www.w3schools.com/Jquery/jquery_selectors.asp)
        $("#Label1").html("This is using an ID Selector"); // Using a [#] to select by an ID (ID Label1)
        $(".ClassDemo").html("This is using a Class Selector"); // Using a [.] to select by a Class (In this case Class Lable2)
        $("span").addClass("SilverStyle"); // Using a ["HTML Element"] to select by all Elements of that type 
        //(In this case All Spans in the DOM)
    })

    $("#Button1").click(function () {
        alert($('#Label4').text());// .text() accesses the innerHTML text of a element
        alert($('#TextBox1').val());// while .val() accesses input objects (TextBoxes, DropDowns,etc.)

        //NOTE: The PostBack will reset it to the original text!
        // The HTML span changes and loses it's state data on a PostBack to the server.
        $('#Span1').text("New Text for span1. At least for 3 seconds!");
        // An ASP:Label and looses its state data with or without the ViewStateMode property being enabled!
        $('#Label4').text("New Text for span1. At least for 3 seconds!");

        //IMPORTANT:
        // If you want the data to persist you need to store it somewhere the client can re-access it
        // or not use code in that overwrites PostBack data, (such as the $(document).ready(function ()...) 
    })
});

</script>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
    //Slowing the response so we can see the change happen easier.
    System.Threading.Thread.Sleep(2000);
}
</script>

</head>
<body>
<form id="form1" runat="server">
<div>
    <h3>Click on the labels and buttons to demonstrate how the JavaScript events and functions work!</h3>
    <asp:Label ID="Label1" runat="server" Text="Label 1 (click me)"></asp:Label>
    <br />
    <asp:Label ID="Label2" Class="ClassDemo" runat="server" Text="Label 2 (click me)"></asp:Label>
    <br />
    <asp:Label ID="Label3" Class="ClassDemo" runat="server" Text="Label 3 (click me)"></asp:Label>
    <br />
    <span id="Span1">This is Original text in an HTML span</span>
    <br />
    <asp:Label ID="Label4" runat="server" Text="This is Original text in an ASP:Label" ViewStateMode="Enabled">
    </asp:Label>&nbsp;&nbsp;
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Text="This is Text in Textbox1"></asp:TextBox>
    &nbsp;
    <asp:Button ID="Button1" runat="server" Text="ASP Button" />
    <br />
    <input type="button" id="HTMLButton" value="This is a HTML Button" onclick=""/>
</div>
</form>
</body>
</html>
