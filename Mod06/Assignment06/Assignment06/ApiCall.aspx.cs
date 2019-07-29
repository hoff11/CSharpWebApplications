using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment06
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ApiHelper api = new ApiHelper();
            api.InitializeClient();

        }
        protected async void ButtonGetData_Click1(object sender, EventArgs e)
        {
            var summData = await GetData.LoadData();
            DataLabel.Text = $"Here is your data {summData.name.ToString()}{ summData.summonerLevel.ToString()}";
        }
    }
}