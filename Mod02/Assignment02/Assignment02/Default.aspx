<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        string filePath = MapPath("~/log.txt");
        string[] lines = { TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text };

        System.IO.StreamWriter objSW = new System.IO.StreamWriter(filePath, true);
        foreach (string line in lines)
        {
            objSW.WriteLine(line);
        }
        objSW.WriteLine();
        objSW.Close();
    }
</script>

<style type="text/css">
    body {
        margin: 0;
    }

    header {
        background-color: darkgrey;
        margin: 0;
    }

        header > h1 {
            margin: 0;
            text-align: center;
        }

    .mainForm {
        width: 500px;
        margin: 50px auto;
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
            color:black
        }

</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Write Data To a Text File Using C#</title>
</head>
<body>
    <header>
        <h1>Write Data To a Text File Using C#</h1>
    </header>
    <form id="form1" runat="server">
        <div class="mainForm">
            <asp:Label runat="server">Name: </asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label runat="server">Email Address: </asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Label runat="server">Login Name: </asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label runat="server">Reason For Access?: </asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="10" Class="TextBox4"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" UseSubmitBehavior="False" Class="FormButton" />

        </div>
    </form>
</body>
</html>
