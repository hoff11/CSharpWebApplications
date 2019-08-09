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
using System.ComponentModel;

namespace Assignment07
{
    public partial class WebForm6 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //instantiate model
            List<AvailableClass> availableclass = new List<AvailableClass>();
            //instantiate DataAccess class for method
            DataAccess data = new DataAccess();
            //set model = dapper output
            availableclass = data.GetClass();
            //convert list to datatable
            var dtConvert = ConvertToDataTable(availableclass);
            Label4.Text = ConvertDataTableToHTML(dtConvert);

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
                StoredProc2.Text = ConvertDataTableToHTML(dt);
                connection.Close();
            }
        }
        public DataTable ConvertToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;
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