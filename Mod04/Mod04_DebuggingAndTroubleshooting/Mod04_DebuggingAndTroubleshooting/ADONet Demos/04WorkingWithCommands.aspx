<%@ Page Title="04" Language="C#" MasterPageFile="~/ADODemosSite.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">
  
        //Note: The connection string variable will be loaded each PostBack.
        string strOledbConnection = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=TempDB";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Reset the label each page load.
            Label1.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
        }

        protected void ButtonSimpleCommands_Click(object sender, EventArgs e)
        {
            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection();
            objOleCon.ConnectionString = strOledbConnection;
            objOleCon.Open();

            //2. Issue a Command
            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand();
            objCmd.Connection = objOleCon;
            objCmd.CommandType = System.Data.CommandType.Text;//Not normally typed out since Text is the default anyway

            //3. Process the Results
            //3a. Commands without Results 
            //When you don't need results back, like these two examples, use ExecuteNonQuery()
            try
            {
                try
                { //Try to create the table
                    objCmd.CommandText = @"Create Table Logins 
                    (LoginId int identity, LoginName nVarchar(20), Password nVarchar(10) )";
                    objCmd.ExecuteNonQuery();
                }
                catch { }

                //Using the same connection, change the SQL code and execute another command.
                objCmd.CommandText = @"Insert Into Logins(LoginName, Password)  
                Values('" + TextBoxLoginName.Text + "', 'Pa$$word')"; //Note: Show how to connect TextBoxPassword.

                int RowsAffected = objCmd.ExecuteNonQuery(); // Ex. Inserts, Updates, Deletes SQL commands
                Label1.Text += "<p>No Results test<p/>";
                Label1.Text += "<p>Number or rows affected: " + RowsAffected.ToString() + "<p/><hr/>";

            }
            catch (Exception ex)
            {
                Label1.Text += ex.ToString();
            }


            //3b. Commands with one Result test
            objCmd.CommandText = "Select Count(*) From Logins";
            int intResult = (int)objCmd.ExecuteScalar();
            Label1.Text += "<p>Scalar Result<p/>";
            Label1.Text += "<p>Number of Logins: " + intResult.ToString() + "<p/><hr/>";

            //3c. Commands multiple Results
            objCmd.CommandText = "Select * From Logins";
            System.Data.OleDb.OleDbDataReader objDR;
            objDR = objCmd.ExecuteReader();
            Label1.Text += "<p>Multiple Results in a Data Reader<p/>";
            Label1.Text += "<p>Number or rows affected: " + objDR.RecordsAffected.ToString();//Gets the number of rows changed, inserted, or deleted  
            Label1.Text += "<p>Number or columns returned: " + objDR.FieldCount.ToString() + "</p>";

            //Since the results are never held within ram, like an array, there is no property 
            //that tells you how many rows are in the results.
            int intRows = 0;
            while (objDR.Read())
            {
                intRows += 1;
            }
            Label1.Text += "<p>Number or rows!</p>" + intRows.ToString();

            //4. Run Clean up code
            objDR.Close();
            objOleCon.Close();

        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Login Name&nbsp;<asp:TextBox ID="TextBoxLoginName" runat="server" Text="DemoLogin"></asp:TextBox>
    <br />
    Password&nbsp;<asp:TextBox ID="TextBoxPassword" runat="server" Text="DemoPassword"></asp:TextBox>
    <br />

    <asp:Button ID="ButtonSimpleCommands" runat="server" Text="Button"
        OnClick="ButtonSimpleCommands_Click" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Style="color: #000066; 
        font-weight: 700; background-color: #FFFFCC" Text="Label"></asp:Label>

</asp:Content>
