<%@ Page Language="C#"  %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Summoner Info</title>
  <script runat="server">
      void Page_Load(object sender, System.EventArgs e)
      {
          Summoner summoner = new Summoner();
          //string strData = Request.QueryString["DataFromText1"];
          //Response.Write("<h1><span style=\"color:Blue\">" + strData + "</span></h1>");
          Response.Write(summoner.SummonerInfoHtml(Request.QueryString["DataFromText1"]));
      }

  </script>
</head>
<body>
  This page will not display anything until another page sends <i>this page</i> some data using a Query string!
</body>

</html>
