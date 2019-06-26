<%@ Page Language="C#" %>

<script runat="server">
    private void Page_Load(object sender, EventArgs e)
    {
        Summoner summoner = new Summoner("Summoner 01", 1241029, 588);

        string ProduceHtml()
        {
            string html;
            html = "<h1>" + summoner.Name + "</h1>";
            html += "<ul><li>" + summoner.Id + "</li><li id=\"summonerImg\">" + summoner.ProfileIconNumber + "</li></ul>";
            return html;
        }
        Response.Write(ProduceHtml());
    }
</script>
<script>
    window.onload = function () {
        var x = document.getElementById("summonerImg").innerText;
        document.getElementById("summonerImg").innerHTML = `<img src="${x}.png"/>`;
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
        </div>
    </form>
</body>
</html>
