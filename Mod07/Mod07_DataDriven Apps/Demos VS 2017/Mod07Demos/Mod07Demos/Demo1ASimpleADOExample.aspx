<%@ Page Language="C#" %>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection();

            string strOledbConnection = @"Provider=SQLOLEDB; Data Source=is-root01.ischool.uw.edu; User ID=CSharp; Password=sql; Initial Catalog=DataDrivenAppDemoDB";
            objOleCon.ConnectionString = strOledbConnection;
            objOleCon.Open();
      
            //2. Issue a Command
            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand("Select Count(*) From Products", objOleCon);
            int intProductCount = (int)objCmd.ExecuteScalar();

            //3. Process the Results (if any)
            Label1.Text = "<p>Number of items: " + intProductCount.ToString() + "</p>";

            //4. Free up resources
            objOleCon.Close();
        }
    </script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
