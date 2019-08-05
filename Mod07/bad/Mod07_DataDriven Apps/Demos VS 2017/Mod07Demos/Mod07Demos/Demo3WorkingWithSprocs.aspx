<%@ Page Language="C#" %>
<script runat="server">
 protected void Page_Load(object sender, EventArgs e)
 {
   //1. Make a Connection
   System.Data.OleDb.OleDbConnection objOleCon;
   objOleCon = new System.Data.OleDb.OleDbConnection();
   objOleCon.ConnectionString = ConfigurationManager.ConnectionStrings["LocalServer"].ConnectionString;
   objOleCon.Open();

   //2. Issue a Command
   System.Data.OleDb.OleDbCommand objCmd;
   objCmd = new System.Data.OleDb.OleDbCommand("pInsCategories", objOleCon);
   objCmd.CommandType = System.Data.CommandType.StoredProcedure;

   //2.1 Add Parameters
   // Declare @RC int, @NewID int;
   // Exec @RC = pInsCategories @CategoryName = 'Cat1', @NewCategoryID = @NewID Output;

   System.Data.OleDb.OleDbParameter objRC;
   objRC = new System.Data.OleDb.OleDbParameter("@RC", System.Data.OleDb.OleDbType.Integer);
   objRC.Direction = System.Data.ParameterDirection.ReturnValue;
   objCmd.Parameters.Add(objRC);

   System.Data.OleDb.OleDbParameter objCatName;
   objCatName = new System.Data.OleDb.OleDbParameter("@CategoryName", System.Data.OleDb.OleDbType.VarWChar, 50);
   objCatName.Direction = System.Data.ParameterDirection.Input;
   objCatName.Value = "Cat from Web";
   objCmd.Parameters.Add(objCatName);

   System.Data.OleDb.OleDbParameter objNewID;
   objNewID = new System.Data.OleDb.OleDbParameter("@NewCategoryID", System.Data.OleDb.OleDbType.Integer);
   objNewID.Direction = System.Data.ParameterDirection.Output;
   objNewID.DbType = System.Data.DbType.Int32;
   objCmd.Parameters.Add(objNewID);

   //2.2 Execute the code
   objCmd.ExecuteNonQuery();

   //3. Process the Results (if any)
   // Select @RC, @NewID;
   Label1.Text += "<p>Return Code: " + objCmd.Parameters["@RC"].Value.ToString() + "</p>";
   Label1.Text += "<p>New Category ID: " + objCmd.Parameters["@NewCategoryID"].Value.ToString() + "</p>";

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
