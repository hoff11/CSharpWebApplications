<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script runat="server"> 
        //This code creates a Web Service with a single Web Method.
        //This is odd, but you can use one ASP.NET page to both view content and
        //background processing, but normally you use a Web Service .asmx page.
        [System.Web.Services.WebMethod]
        public static string GetServerOutput()
        {
            return DateTime.Now.ToLongTimeString();
        }
    </script>

    <script src="Scripts/jquery-3.4.1.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#Button1").click(function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    url: "webform3.aspx/GetServerOutput",
                    success: function (data) {
                        $("#spanResults").html(data.d);
                    },
                    error: function () {
                        alert("The call to the web service failed.");
                    }
                })
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="Button1" type="button" value="Button1" />
            <br />
            <br />
            <span id="spanResults"></span>
        </div>
    </form>
</body>
</html>

