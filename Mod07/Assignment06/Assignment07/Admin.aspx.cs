using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Assignment07.SqlHelper;
using Dapper;
using System.Text;

namespace Assignment07
{
    public partial class WebForm6 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder table = new StringBuilder();
            List<AvailableClass> availableclass = new List<AvailableClass>();
            DataAccess data = new DataAccess();
            availableclass = data.GetClass();
            table.Append("<table>");
            table.Append("")

            StoredProcTwo();
        }

        public void StoredProcTwo()
        {
            using (var connection = new SqlConnection(SqlHelper.ConnValue("UW")))
            {
                SqlCommand cmd = new SqlCommand("pSelClassesByStudentId", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StudentId", 1);

                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                ConvertDataTableToHTML(dt);
                connection.Close();
            }
        }
        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "<table>";
            //add header row
            html += "<tr>";
            for (int i = 0; i < dt.Columns.Count; i++)
                html += "<td>" + dt.Columns[i].ColumnName + "</td>";
            html += "</tr>";
            //add rows
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                for (int j = 0; j < dt.Columns.Count; j++)
                    html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                html += "</tr>";
            }
            html += "</table>";
            return html;
        }
    }
}