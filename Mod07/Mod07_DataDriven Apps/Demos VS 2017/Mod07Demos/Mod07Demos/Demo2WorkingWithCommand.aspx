<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">
protected void Button1_Click(object sender, EventArgs e)
{
  //1. Make a Connection
  System.Data.OleDb.OleDbConnection objOleCon;
  objOleCon = new System.Data.OleDb.OleDbConnection();
  objOleCon.ConnectionString = ConfigurationManager.ConnectionStrings["RemoteServer"].ConnectionString;
  objOleCon.Open();

  //2. Issue a Command
  System.Data.OleDb.OleDbCommand objCmd;
  objCmd = new System.Data.OleDb.OleDbCommand();
  objCmd.Connection = objOleCon;
  objCmd.CommandType = System.Data.CommandType.Text;
  //Not normally typed out since Text is the default anyway

  //3. Process the Results
  //3a. Commands without Results 
  //When you don't need results back, like these two examples, use ExecuteNonQuery()
  objCmd.CommandText = @"Create Table Demo1 (ID int Primary Key, Name nVarchar(50))";
  Label1.Text = "<p>No Results</p>";
  try
  {
      int RowsAffected = objCmd.ExecuteNonQuery(); 
      // Ex. Inserts, Updates, Deletes SQL commands
      Label1.Text += "<p>Table Created</p>";
  }
  catch (Exception ex)
  {
      Label1.Text += ex.Message.ToString() + "<hr/>";
  }

  objCmd.CommandText = @"Insert Into Demo1 (ID, Name) Values(1, 'Test Data')";
  try
  {
      int RowsAffected = objCmd.ExecuteNonQuery(); 
      // Ex. Inserts, Updates, Deletes SQL commands
      Label1.Text += "<p>Row Added</p>";
  }
  catch (Exception ex)
  {
      Label1.Text += ex.Message.ToString() + "<hr/>";
  }

 
  //3b. Commands with one Result 
  objCmd.CommandText = "Select Count(*) From Demo1";
  try
  {
      int intResult = (int)objCmd.ExecuteScalar();
      Label2.Text = "<p>Scalar Result</p>";
      Label2.Text += "<p>Number of Row in Table: " + intResult.ToString() + "</p>";
  }
  catch (Exception ex)
  {
      Label2.Text += ex.ToString();
  }

  //3c. Commands multiple Results
  objCmd.CommandText = "Select ID, Name From Demo1";
  System.Data.OleDb.OleDbDataReader objDR;
  try
  {
      objDR = objCmd.ExecuteReader();
      Label3.Text = "<p>Multiple Results</p>";
      while (objDR.Read() == true)
      {
          Label3.Text += "<p>" 
              + objDR["ID"].ToString() + ", " + objDR["Name"].ToString() 
              + @"</p>";
      }
      objDR.Close();
  }
  catch (Exception ex)
  {
      Label3.Text = ex.ToString();
  }

  //4. Free up Resources
  objOleCon.Close();
}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
        <br />
    </div>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</form>
</body>
</html>