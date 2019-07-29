<%@ Page Title="02" Language="C#" MasterPageFile="~/ADODemosSite.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">
  
        string strOledbConnection = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=TempDB";

        protected void Button1_Click(object sender, EventArgs e)
        {

            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection();
            objOleCon.ConnectionString = strOledbConnection;
            objOleCon.Open();

            //2. Issue a Command
            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand();
            objCmd.Connection = objOleCon;
            objCmd.CommandType = System.Data.CommandType.Text;


            //3. Process the Results with a DataAdapter
            objCmd.CommandText = "Select LoginId, LoginName From Logins";

            System.Data.OleDb.OleDbDataAdapter objDA;
            objDA = new System.Data.OleDb.OleDbDataAdapter();
            objDA.SelectCommand = objCmd;

            System.Data.DataSet objDS = new System.Data.DataSet();
            objDA.Fill(objDS, "LoginList");

            //Display data and value data are different example
            DropDownList1.DataSource = objDS.Tables["LoginList"];
            DropDownList1.DataTextField = "LoginName";
            DropDownList1.DataValueField = "LoginId";
            DropDownList1.DataBind();

            //Filling an Array
            ArrayList objLoginList = new ArrayList();
            foreach (System.Data.DataRow item in objDS.Tables["LoginList"].Rows)
            {
                objLoginList.Add(item["LoginName"]);
            }
            RadioButtonList1.DataSource = objLoginList;
            RadioButtonList1.DataBind();


            //Data Binding example
            #region Why is Resetting the DataAdapter *NOT* needed?

            //objDA = new System.Data.OleDb.OleDbDataAdapter();
            //objDS = new DataSet();
            //objDA.Fill(objDS, "ProductList");

            #endregion

            GridView1.DataSource = objDS.Tables["LoginList"];
            GridView1.DataBind();


            //4. Clean up code
            objOleCon.Close();
        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Working the DataAdapters"
        Style="font-weight: 700; font-size: xx-large"></asp:Label>
    <div>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <br />
    </div>

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
        Text="Load Data" Width="213px" />

</asp:Content>
