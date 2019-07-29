<%@ Page Title="Home" Language="C#" MasterPageFile="~/Default.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <%--Client Script, --%>
    <script type="text/javascript">
        $(document).ready(DisplayMsg());

        function DisplayMsg() {
            alert("JQuery is working in Lab01");
        }
    </script>



    <%--Server Code,--%>
    <script runat="server">

    </script>

    <%--CSS--%>
    <style>
        .ib {
            background: salmon;
            border: solid red 1px;
            display: inline-block;
            width: 45%;
            vertical-align: top
        }
    </style>
</asp:Content>

<asp:Content ID="HomePage" ContentPlaceHolderID="HomePageMain" runat="server">
    <h2>Welcome to the Home Page!!!!!</h2>
    <div class="ib">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div>
    <div class="ib">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum..</div>
</asp:Content>
