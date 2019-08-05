<%@ Page Language="C#" %>
<!DOCTYPE html>
<script runat="server">
   Mod07Demos.DataDrivenAppDemoDBEntities objEF;
   protected void Page_Load(object sender, EventArgs e)
   { 
     objEF = new Mod07Demos.DataDrivenAppDemoDBEntities();
   }
   
   protected void Button1_Click(object sender, EventArgs e)
   { //Select From a Table
     Label1.Text = "";
     foreach (Mod07Demos.Product row in objEF.Products)
     {
      Label1.Text += "<p>" + row.ProductId.ToString()
                  + ", " + row.ProductName.ToString()
                  + ", " + row.CategoryId.ToString()
                  + "</p>";
     }
   }
   
   protected void Button2_Click(object sender, EventArgs e)
   {
     //Insert using a stored procedure
     Label2.Text = "";
     try
     {
       objEF.pInsProducts(TextBoxProductName.Text, int.Parse(TextBoxCategoryId.Text));
       Label2.Text = "Inserted";
     }
     catch (Exception ex)
     { Label2.Text = ex.Message.ToString(); }
   }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo4</title>
</head>
<body>
    <form id="form1" runat="server">
      <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Select Button" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Insert Button" />
        <br />
        <asp:Label ID="LabelProductName" runat="server" Text="ProductName: "></asp:Label>
        <asp:TextBox ID="TextBoxProductName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LabelCategoryId" runat="server" Text="CategoryId: "></asp:Label>
        <asp:TextBox ID="TextBoxCategoryId" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
        <br />
      </div>
    </form>
</body>
</html>