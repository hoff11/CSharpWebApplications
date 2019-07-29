<%@ Page Title="02WorkingWithJQuery" Language="C#" MasterPageFile="~/Lesson5Site.Master"  %>  
<%--My JQuery Reference is in the Master page!--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () { alert("This is a test"); });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>Add jQuery to your project site. (NuGet or http://jquery.com/download/)</li>
        <li>Add a Reference to the file in your page using the Script tag with a src attribute</li>
        <li>Add your JavaScript code to one or more script blocks.</li>
        <li>In older versions of Visual Studio download a document file for IntelliSense.</li>
    </ol>
</asp:Content>
