<%@ Page Language="C#" %>
<script runat="server"> 
    //You place a Web Service in a separate .asmx code page.
    [System.Web.Services.WebMethod]
    public static string GetServerOutput()
    {
        return DateTime.Now.ToLongTimeString();
    }
</script>