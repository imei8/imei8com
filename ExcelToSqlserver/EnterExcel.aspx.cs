/*
 *张国强 2014-02-20
 *excel 表头检查
 *数据表读取数据
 *SQlserver数据表表头检查
 *主要操：EXCEL 数据表读取
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
///
using CommonLib;
using System.Configuration;

namespace ExcelToSqlserver
{
    public partial class EnterExcel : System.Web.UI.Page
    {

        XMLBase xmlBase = new XMLBase();
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 检查数据列表
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            xmlBase.LoadDome();
            string che = xmlBase.Check("RZZGTZ", "任职资格台账");
            //
        }

        /// <summary>
        /// 导入数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOK_Click(object sender, EventArgs e)
        {

        }
    }
}