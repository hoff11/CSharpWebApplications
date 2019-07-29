<%@ Page Title="02" Language="C#" MasterPageFile="~/ADODemosSite.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">
  
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection();
            objOleCon.ConnectionString = @"Provider=SQLOLEDB;Data Source=(local);
                                        Integrated Security=SSPI;
                                        Initial Catalog=Master";
            objOleCon.Open();

            //2. Issue a Command
            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand("Select Count(*) From Sys.Databases", objOleCon);
            int intOrderCount = (int)objCmd.ExecuteScalar();

            //3. Process the Results
            Label1.Text += "<b>" + intOrderCount.ToString() + "</b>";

            //4. Run clean up code
            objOleCon.Close();
        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" 
        Text="The Number of Databases on this SQL Server is: "
        Style="font-size: large"></asp:Label>

</asp:Content>
