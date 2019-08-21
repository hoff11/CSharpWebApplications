<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication11.WebForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <div>
            WebForm1
            <form action="http://localhost:51063/Default/Index" method="post">
            <input type="text" id="TextData" name="TextData" /> 
            <input type="hidden" id="HiddenData" name="HiddenData" value="Some Hidden Data" />
            <input type="submit" />
                
        </form>
        </div>

</body>
</html>
