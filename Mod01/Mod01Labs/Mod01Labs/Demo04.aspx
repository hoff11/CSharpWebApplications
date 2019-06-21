<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Demo04</title>

  <script runat="server">
    void Page_Load()
    {
        lblServerTime.Text = DateTime.Now.ToString();
    }
  </script>

</head>
<body>

  <form id="form1">
    <div>
      The current time is:
      <asp:Label ID="lblServerTime" runat="server" />
    </div>
  </form>

</body>
</html>
