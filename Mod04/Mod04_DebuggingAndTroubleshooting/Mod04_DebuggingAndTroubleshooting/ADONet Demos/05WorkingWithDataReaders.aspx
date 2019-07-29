<%@ Page Title="02" Language="C#" MasterPageFile="~/ADODemosSite.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">
  
        string strOledbConnection = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=TempDB";

        protected void Button1_Click(object sender, EventArgs e)
        {
            //1. Make a Connection
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection(strOledbConnection);

            //2. Issue a Command
            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand("Select LoginId, LoginName From Logins", objOleCon);

            //3. Process the Results with a DataReader
            objOleCon.Open();
            System.Data.OleDb.OleDbDataReader objDR;
            objDR = objCmd.ExecuteReader();

            //Collect Data in an ArrayList
            ArrayList objLoginList = new ArrayList();

            while (objDR.Read() == true)
            {
                //Display data and value data will be the same in this example (Use View Source to see!)
                DropDownList1.Items.Add((string)objDR["LoginName"]);

                //To use different display data and value data 
                //you create ListItem objects and add them to a Listbox.
                ListItem objLI = new ListItem();
                objLI.Value = ((int)objDR[0]).ToString();
                objLI.Text = (string)objDR["LoginName"];

                DropDownList2.Items.Add(objLI);

                //Filling an ArrayList
                objLoginList.Add(objDR.GetString(1));
            }

            //Using an ArrayList to DataBind to a Radio Button.
            RadioButtonList1.DataSource = objLoginList;
            RadioButtonList1.DataBind();


            //Using the Data Reader to directly Data Bind to a GridView
            //Note: Once you have walked through the results of a Data Reader
            //You must close it to loop through it again!
            objDR.Close();
            objDR = objCmd.ExecuteReader();

            GridView1.DataSource = objDR;
            GridView1.DataBind();

            //4. Run Clean up code
            objDR.Close();
            objOleCon.Close();
        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Working with DataReaders"
        Style="font-weight: 700; font-size: xx-large"></asp:Label>

    <div>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server">
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
        Text="Press the buttom to load data into the controls" Width="300px" />

</asp:Content>
