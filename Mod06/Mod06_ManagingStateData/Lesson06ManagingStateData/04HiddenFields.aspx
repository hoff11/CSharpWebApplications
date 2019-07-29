<%@ Page Title="Demo 04" Language="C#" MasterPageFile="~/Lesson06Site.Master" Trace="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script runat="server">
    
    [Serializable]
    class Person {
        public string FirstName, LastName;
        public Person(string FirstName, string LastName)
        { this.FirstName = FirstName; this.LastName = LastName; }//end Constructor
    }//End Class

    protected void Page_Load()
    {   //Create and persist an object on the First Page request!
        if (!IsPostBack)
        {
            ViewState["objP"] = new Person("Bob", "Smith");
        }
        else
        { //You can presist the data using Server Side code like this.
          //Uncomment this line to see an example! 
          Label1.Text = HiddenField1.Value; 
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e) {
        //ViewState["objP"] = new Person("Bob", "Smith");
        string strData = ((Person)ViewState["objP"]).FirstName;
        strData += "," + ((Person)ViewState["objP"]).LastName;
        HiddenField1.Value = strData;
        Response.Write(strData);
        Response.Write("<hr/>"); }//end Button1_Click()
</script>

<%-- Adding Microsoft's jQueryCDN  --%>
<script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
    //I will use this script block is for my Client Event Handling
    function ClientCodeButton_Click() {
        //Let's get a reference to Lable1
        var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");

        //Now let's work with the HiddenField to get the Person's Data!
        //Get String data from Hidden Field

        var strData = (document.getElementById("ContentPlaceHolder1_HiddenField1")).value + "-client";
        //Use the String data
        if (strData != "") {
            objLabel1.innerHTML = strData; //Set the Client Values to ( Bob,Smith )
            alert( "\n" + "By default, Server values overwrite the new Values" + 
                   "(" + strData + ") on PostBack!");
        }
    }

    // You can also use client side code can re-access the Hidden value!
    /***** Uncomment this section to see an example! ****
    $(document).ready(function () {
        var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");
        var strData = (document.getElementById("ContentPlaceHolder1_HiddenField1")).value + "-re-access";
        objLabel1.innerHTML = strData;
    })
    */
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Click This Button Twice"
        AutoPostBack="false"
        OnClientClick="ClientCodeButton_Click()" OnClick="Button1_Click" /><br />
    <asp:Label ID="Label1" runat="server" Text="Label 1" ></asp:Label>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>
