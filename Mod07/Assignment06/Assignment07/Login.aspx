<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment07.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <%--CSS--%>
    <style type="text/css">
        .mainForm {
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
        .formrow {
            margin: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Login" ContentPlaceHolderID="LoginPage" runat="server">
    <h2>Login</h2>
    <div class="container">
        <div id="mainform">
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Name: </asp:Label>
                <asp:TextBox ID="txtboxName" runat="server" CssClass="col-sm-9 form-control"></asp:TextBox>
            </div>
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Email: </asp:Label>
                <asp:TextBox ID="txtboxEmail" runat="server" CssClass="col-sm-9 form-control"></asp:TextBox>
            </div>
            <div class="row formrow justify-content-center">
                <asp:Button CssClass="" ID="LoginButton" runat="server" Text="Login" Class="FormButton" OnClick="LoginButton_Click"  />
            </div>
            <div class="row formrow justify-content-center">
                <asp:Label ID="loginnotification" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>
