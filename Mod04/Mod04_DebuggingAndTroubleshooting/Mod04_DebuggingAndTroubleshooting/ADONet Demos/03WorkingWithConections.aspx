<%@ Page Title="03" Language="C#" MasterPageFile="~/ADODemosSite.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">
  
        //Topic 1) There are a number of choices you can make regarding connection strings.
        //    * Choose a Connection Class ( SQL, OleDB, ODBC )
        //    * Choose to storing the string in the page or a Web.config file
        //    * Choose to cache the string in a Session variable, the ViewState, a Application variable, etc.
        //    * Choose which event should load the string.


        //Topic 2) You can declare "normal" variables to hold the connection strings, 
        //this option is often used in Windows applications, but because of the stateless nature of HTTP, 
        //it must be reset each time the page loads, unless you cache it somewhere.
        string strSQLConnection = @"Data Source=(local);Initial Catalog=Northwind;Integrated Security=True;";

        //Topic 3) Using the page load event to set the connection string is quite common.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                //Load the connection string only on the first request.
                string strOleDBConnection = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=Northwind;";

                //Optionally, you can cache the connection string somehow so it does not keep recreating the same string object.   

                //Storing the Connection String in as part of the ViewState (Lower security!! Client will have connection string!).
                if (ViewState["MyConString"] == null) { ViewState.Add("MyConString", strOleDBConnection); }

                //Storing the Connection String in a Session Variable.
                if (Session["MyConString"] == null) { Session.Add("MyConString", strOleDBConnection); }

                //Storing the Connection String in as a Application Variable.
                if (Application["MyConString"] == null) { Application.Add("MyConString", strOleDBConnection); }
            }
        }

        //Topic 4) However, you can also wait and load the connection string only is a button is pressed. 
        //Still, if you do so, the connection string will only be available for code within the buttons' event handler method.
        protected void ButtonConnectionStrings_Click(object sender, EventArgs e)
        {
            //For SQL 7.0, 2000, 2005, and 2008...
            System.Data.SqlClient.SqlConnection objSQLCon;
            string strSQLConnection = @"Data Source=(local)\SQLExpress;Initial Catalog=Northwind;Integrated Security=True;";

            //For anything not covered by SQLConnection
            System.Data.OleDb.OleDbConnection objOleCon;
            string strOledbConnection = @"Provider=SQLOLEDB;Data Source=(local)\SQLExpress;Integrated Security=SSPI;Initial Catalog=Northwind;";

            //For anything not covered by OleDB because it is really "Olde"
            System.Data.Odbc.OdbcConnection objOdbcCon;
            string strOdbcConnection = @"Driver={SQL Server};server=(local)\SQLExpress;trusted_connection=Yes;database=Northwind;";

            //Reading a Connection String from the Web Config File is a very common way to use connection strings.
            //and is often recommend by Microsoft.
            System.Configuration.ConnectionStringSettings objConSettings;
            objConSettings = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Northwind"];
            Response.Write(objConSettings.ConnectionString);
        }

        //Topic 5) You can test your connection using the State property.
        protected void ButtonTestingConnectivity_Click(object sender, EventArgs e)
        {
            //1. Make a Connection object
            System.Data.OleDb.OleDbConnection objOleCon = new System.Data.OleDb.OleDbConnection();
            objOleCon.ConnectionString = Application["MyConString"].ToString();

            try
            {
                objOleCon.Open();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }

            //You can check to see if a connection open with the connection's State property.
            if (objOleCon.State == System.Data.ConnectionState.Open)
            { Label1.Text = "The connection was opened!"; }

            //2. Issue a Command
            //3. Process the Results
            //4. Run clean up code
            objOleCon.Close();
        }

        //Topic 6) The connection object only has a couple of events, StateChange is one of them.
        protected void ButtonStateChangeEvent_Click(object sender, EventArgs e)
        {
            //Reset the label for this demo.
            Label1.Text = "From ButtonStateChangeEvent_Click";

            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon = new System.Data.OleDb.OleDbConnection();

            //Reminder: After typing the +=, use "Tab,Tab" to have Visual Studio Create the event handler code for you!
            objOleCon.StateChange += objOleCon_StateChange;

            try
            {
                objOleCon.ConnectionString = Application["MyConString"].ToString();
                objOleCon.Open(); //Will fire the StateChange Event Handler
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }
            finally
            {
                // You should explicitly close your connections...
                objOleCon.Close();  //Will fire the StateChange Event Handler

                //Note: If this is left out it will eventually be close by the Garbage Collector.
                //but the StateChange Event Handler will have been removed by then!
            }
        }

        void objOleCon_StateChange(object sender, System.Data.StateChangeEventArgs e)
        {
            Label1.Text += "<p/>State " + e.CurrentState.ToString() + " at: " + DateTime.Now.ToLongTimeString();
        }

    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="ButtonConnectionStrings" runat="server" Text="Working with Connection Strings"
        Width="360px" OnClick="ButtonConnectionStrings_Click" />
    <br />
    <br />
    <asp:Button ID="ButtonTestingConnectivity" runat="server" Text="Testing Connectivity"
        Width="360px" OnClick="ButtonTestingConnectivity_Click" />
    <br />
    <br />
    <asp:Button ID="ButtonStateChangeEvent" runat="server" Text="Interacting with the StateChange Event"
        Width="360px" OnClick="ButtonStateChangeEvent_Click" />
    <p>
        <asp:Label ID="Label1" runat="server" Style="color: #000066; font-weight: 700; background-color: #FFFFCC"
            Text="Label"></asp:Label>
    </p>
</asp:Content>
