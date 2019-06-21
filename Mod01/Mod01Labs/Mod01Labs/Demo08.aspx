<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
  <meta charset="utf-8" />
  <title>Demo08</title>
  <script runat="server">
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
      //Olde, ASP, way of getting form data...
      string strName = Request.Form["TextBoxName"];
      string strPassword = Request.Form["TextBoxPassword"];
      Response.Write("<span style=\"color:Red\">Name: " + strName + "</span><hr/>");
      Response.Write("<span style=\"color:Red\">Password: " + strPassword + "</span>");

      //The modern ASP.NET way of getting form data ...
      strName = TextBoxName.Text;
      //Response.Write(strName);
      LabelInfo.Text = "Name: " + strName + "<hr/> Password: " + TextBoxPassword.Text;
      LabelInfo.ForeColor = System.Drawing.Color.Green;
    }
  </script>
  <style type="text/css">
    .style1 {
      width: 27%;
    }

    .style2 {
      width: 76px;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <br />
      Please Login in to accessed your information.
      <br />
      <br />
      <table class="style1">
        <tr>
          <td class="style2">
            <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
          </td>
          <td>&nbsp;
            <asp:TextBox ID="TextBoxName" runat="server" Width="150px"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="style2">
            <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>
          </td>
          <td>&nbsp;
            <asp:TextBox ID="TextBoxPassword" runat="server" Width="150px"></asp:TextBox>
          </td>
        </tr>
      </table>
      <br />
      <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click"
                  Text="Login" Width="253px" />
      <br />
      <br />
      &nbsp;<asp:Label ID="LabelInfo" runat="server" Text="(Information)"></asp:Label>
    </div>
  </form>
</body>
</html>
