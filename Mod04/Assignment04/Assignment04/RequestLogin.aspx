<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="RequestLogin.aspx.cs" Inherits="Assignment04.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <%--Client Script, --%>
    <script type="text/javascript">
    //alert("Client Page JavaScript");
    </script>

    <%--Server Code,--%>
    <script runat="server">

    </script>


    <%--CSS--%>
    <style type="text/css">
        .mainForm {
            width: 500px;
            margin: 0 auto;
            font: bold 14px arial, verdana;
        }

            .mainForm > input[type=text], .TextBox4 {
                width: 100%;
            }

        .FormButton {
            display: inline-block;
            border-radius: 4px;
            background-color: #f4511e;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 28px;
            padding: 20px;
            width: 200px;
            cursor: pointer;
            margin: 5px;
        }

            .FormButton:hover {
                color: black
            }
    </style>
</asp:Content>



<asp:Content ID="RequestLogin" ContentPlaceHolderID="RequestLoginPage" runat="server">
    <h2>Request Your Login</h2>
    <div class="mainForm">
        <asp:Label runat="server">Name: </asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label runat="server">Email Address: </asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label runat="server">Login Name: </asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Label runat="server">Reason For Access?: </asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="10" Class="TextBox4"></asp:TextBox>
        <asp:Button ID="RegisterButton" runat="server" Text="Register"  UseSubmitBehavior="False" Class="FormButton" OnClick="RegisterButon" />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
</asp:Content>
