<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Default.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
<%--Client Script, --%>
<script type="text/javascript">
    //alert("Client Page JavaScript");
</script>

<%--Server Code,--%>
<script runat="server">

</script>

<%--CSS--%>
<style>
    .blueColor {
        border: medium dashed #0000FF;
    }
</style>
</asp:Content>

<asp:Content ID="AboutUs" ContentPlaceHolderID="AboutUsPage" runat="server">
About Us
</asp:Content>