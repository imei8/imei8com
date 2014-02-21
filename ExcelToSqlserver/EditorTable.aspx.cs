using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExcelToSqlserver
{
    public partial class EditorTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCName.Text = Request.QueryString["cName"].ToString();
                hiddTableName.Value = Request.QueryString["eName"].ToString();
            }
        }
    }
}