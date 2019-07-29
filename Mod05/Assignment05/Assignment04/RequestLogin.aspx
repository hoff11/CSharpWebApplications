<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="RequestLogin.aspx.cs" Inherits="Assignment05.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">

    <%--Client Script, --%>
    <script type="text/javascript">

    </script>

    <%--Server Code,--%>
    <script runat="server">

    </script>


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



<asp:Content ID="RequestLogin" ContentPlaceHolderID="RequestLoginPage" runat="server">
    <h2>Request Your Login</h2>

    <div class="container">
        <div id="mainform">
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Name: </asp:Label>
                <asp:TextBox ID="txtboxName" runat="server" CssClass="col-sm-9 form-control"></asp:TextBox>
            </div>
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Email Address: </asp:Label>
                <asp:TextBox ID="txtboxEmail" runat="server" CssClass="col-sm-9 form-control" ClientIDMode="Static" CausesValidation="true"></asp:TextBox>
            </div>
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Login Name: </asp:Label>
                <asp:TextBox ID="txtboxLoginName" runat="server" CssClass="col-sm-9 form-control"></asp:TextBox>
            </div>
            <div class="row formrow">
                <asp:Label runat="server" CssClass=" col-sm-3">Reason For Access? </asp:Label>
                <asp:TextBox ID="txtboxReason" runat="server" TextMode="MultiLine" Rows="5" Class="TextBox4" CssClass="col-sm-9 form-control"></asp:TextBox>
            </div>
            <div class="row justify-content-center">
                <asp:Button ID="RegisterButton" runat="server" Text="Register" UseSubmitBehavior="False" Class="FormButton" OnClick="RegisterButon" />
            </div>
            <div class="row">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
