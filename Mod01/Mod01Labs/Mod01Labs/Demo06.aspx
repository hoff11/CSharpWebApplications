<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <meta charset="utf-8" />
  <title>Demo06</title>

  <script type="text/javascript">
    function startTime() {
      document.getElementById('spanNowClt').innerHTML = new Date();
    }
  </script>

  <script runat="server">
      void Page_Load()
      {
        spanNowSvr.InnerText = DateTime.Now.ToLocalTime().ToLongTimeString();
      } 
  </script>

</head>
<body onload="startTime()">
  <form id="form1" runat="server">
    <div>
      <p>
        Client Code: <span id="spanNowClt" />
        <br />
      </p>
      <p>
        Server Code: <span id="spanNowSvr" runat="server" />
        <br />
      </p>
    </div>
  </form>
</body>
</html>
