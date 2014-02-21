/**
 *张国强 2014-02-20 
 *将excel中的数据表结构序列化到XML中
 *同时在数据库中创建数据表结构方便数据导入到数据中。
 *InsertXML(HttpContext context) 将界面录入的数据列名导入到XML数据结构中
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//
using System.Configuration;
using CommonLib;
using System.Data;
using System.Data.SqlClient;

namespace ExcelToSqlserver.Ajax
{
    /// <summary>
    /// CreatInfoToXML 的摘要说明
    /// </summary>
    public class CreatInfoToXML : IHttpHandler
    {
        XMLBase xmlBase = new XMLBase();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            InsertXML(context);

        }

        //序列化数据到XML文件中
        private void InsertXML(HttpContext context)
        {
            //获取值
            string tableEName = context.Request.Form["tableName"];
            string tableCName = context.Request.Form["tableCName"];
            string mess = context.Request.Form["mess"];
            //拆分列名
            if (mess == "") return;
            mess = mess.Substring(0, mess.Length - 1);
            //第一次拆分数据
            string[] split1 = mess.Split('|');
            string sql="create table "+tableEName+"(";
            for (int i = 0; i < split1.Length; i++)
            {
                string mess2 = split1[i];
                string[] split2 = mess2.Split('_');
                //获取值
                string eName = split2[0].ToString();
                string eType = split2[1].ToString();
                string cName = split2[2].ToString();
                string eLenght = split2[3].ToString();
                //生成sql语句
                sql += eName + " " + eType + " ,";
                try
                {
                    xmlBase.LoadDome();
                    xmlBase.InsertNode(tableCName, tableEName, eName, eType, cName, eLenght);
                    //生成数据表
               
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            CreatTable(sql);
        }

        private void CreatTable(string tableSql)
        {
            string constr = ConfigurationManager.ConnectionStrings["SqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            if (tableSql != "")
                tableSql = tableSql.Substring(0,tableSql.Length-1);
            string sql = tableSql + ")";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
      

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}