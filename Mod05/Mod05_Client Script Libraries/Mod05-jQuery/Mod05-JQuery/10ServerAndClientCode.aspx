<%@ Page Title="02" Language="C#" MasterPageFile="~/Lesson5Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <style>
        .table.table-RjRsDEMO {
            background-color: gold;
        }
        /* Styles can sub-classed*/
    </style>

    <script runat="server">
        protected void getDataButton_Click(object sender, EventArgs e)
        {
            System.Data.OleDb.OleDbConnection objOleCon = new System.Data.OleDb.OleDbConnection();
            System.Data.OleDb.OleDbCommand objCmd = new System.Data.OleDb.OleDbCommand();
            try
            {   //1. Make a Connection
                string strOledbConnection = @"Provider=SQLOLEDB;
                                    Data Source=.\SQLExpress;
                                    Integrated Security=SSPI;
                                    Initial Catalog=ASPNetHomework";
                objOleCon.ConnectionString = strOledbConnection;
                objOleCon.Open();

                //2. Issue a Command
                objCmd.Connection = objOleCon;
                objCmd.CommandText =
                    @"Select LoginID, Name, EmailAddress, LoginName, ReasonForAccess From Logins";
                System.Data.OleDb.OleDbDataReader objDR = objCmd.ExecuteReader();

                //3. Process the Results
                string strTable =
                    @"<table class='table table-bordered table-hover table-condensed table-RjRsDEMO'>
                          <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Login</th>
                                <th>Reason</th>
                            </tr>
                          </thead>
                          <tbody>";

                while (objDR.Read() == true)
                {
                    strTable += "<tr>";
                    strTable += "<td>" + objDR["LoginID"] + "</td>";
                    strTable += "<td>" + objDR["Name"] + "</td>";
                    strTable += "<td>" + objDR["EmailAddress"] + "</td>";
                    strTable += "<td>" + objDR["LoginName"] + "</td>";
                    strTable += "<td>" + objDR["ReasonForAccess"] + "</td>";
                    strTable += "</tr>";
                }

                strTable += @"</tbody>
                            </table>";

                lblTable.Text = strTable;

            }

            catch (Exception ex) { lblMessage.Text += "<b>" + ex.ToString() + "</b>"; }
            finally { objOleCon.Close(); } //4. Run clean up code
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="getDataButton" runat="server" Text="Get Data" OnClick="getDataButton_Click" />
        &nbsp;<asp:Literal ID="lblTable" runat="server" Text=""></asp:Literal>
        &nbsp;<asp:Label ID="lblMessage" runat="server" Text="" Style="font-size: large"></asp:Label>
    </div>
</asp:Content>

