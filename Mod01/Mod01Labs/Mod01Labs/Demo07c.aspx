<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Demo07c</title>
  <script runat="server">
    void Page_Load(object sender, System.EventArgs e)
    {
      string strData = Request.Form["DataFromText2"];
      Response.Write("<h1><span style=\"color:Red\">" + strData + "</span></h1>");
    } 
 </script>
</head>
<body>
  This page will not display anything until another page sends <i>this page</i> some data using an HTTP Post!
</body>
</html>
