using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CommonLib;

namespace ExcelToSqlserver
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 添加节点
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            XMLBase xmlBase = new XMLBase();
            xmlBase.LoadDome();
            xmlBase.InsertNode(txtCname.Text,txtEName.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            XMLBase xmlBase = new XMLBase();
            xmlBase.LoadDome();
            bool res = xmlBase.UpdateNode(txtCname.Text, txtEName.Text);
            Label1.Text = res.ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            XMLBase xmlBase = new XMLBase();
            xmlBase.LoadDome();
           bool res= xmlBase.CheckNode(txtCname.Text, txtEName.Text);
           Label1.Text = res.ToString();
        }
    }
}