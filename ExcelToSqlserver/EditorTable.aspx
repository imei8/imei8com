<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditorTable.aspx.cs" Inherits="ExcelToSqlserver.EditorTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据库表头设计</title>
    <script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        当前位置：添加表头<br />
        <br />
        数据表名称：<asp:TextBox ID="txtCName" runat="server" ReadOnly="True"></asp:TextBox>
        <input type="hidden" runat="server" id="hiddTableName" />
        <br />
        <br />

        <div class="divCoulm">
            <hr />
            英文名：<input class="txtEName" type="text" />
            &nbsp; 对应数据类型：<select class="rdType">
                <option value="nvarchar(MAX)" selected="selected">文字类型</option>
                <option value="float">小数类型</option>
                <option value="int">整数类型</option>
            </select>
            <br />
            <br />
            备注名：<input type="text" class="txtBeizhu" />
            &nbsp; 数据字节长度：<select class="txtLenght">
                <option value="varchar(10)">10</option>
                <option value="varchar(20)">20</option>
                <option value="nvarchar(MAX)">最大</option>
            </select>
            <br />
            <br />
            <hr />
        </div>
        <input type="button" value="继续添加数据列" id="btnGo" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="确定" id="btnOK" />
    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {

        //声明列名录入界面
        var addDocument = "   <div class='divCoulm'> <hr />  英文名：<input class='txtEName' type='text' /> &nbsp; 对应数据类型：<select class='rdType'>";

        addDocument += " <option value='nvarchar(MAX)' selected='selected'>文字类型</option> <option value='float'>小数类型</option>";

        addDocument += " <option value='varchar(9)'>整数类型</option></select><br /> <br />  备注名：<input type='text' class='txtBeizhu' />";

        addDocument += "   &nbsp; 数据字节长度：<select class='txtLenght'> <option value='varchar(10)'>10</option> <option value='varchar(20)'>20</option><option value='nvarchar(MAX)'>最大</option></select>    <br /> <br />  <hr />  </div>";

        $("#btnGo").click(function () {
          var isGo;
            var div = $(this).prev("div");
            var eName = div.children(".txtEName").val();//英文名
            var eType = div .children(".rdType").val();//数据类型
            var cName = div .children(".txtBeizhu").val();//中文名称
            var cLength = div.children(".txtLenght").val();//字段长度
                isGo = CheckVoide(eName, eType, cName, cLength);
           
            if (!isGo) { alert("数据有误"); } else {
                $(".divCoulm").last().append(addDocument);
            }
        });

        $("#btnOK").click(function () {
            //获取数据
            var mess = "";
            $(".divCoulm").each(function () {
                var eName = $(this).children(".txtEName").val();//英文名
                var eType = $(this).children(".rdType").val();//数据类型
                var cName = $(this).children(".txtBeizhu").val();//中文名称
                var cLength = $(this).children(".txtLenght").val();//字段长度
                var isGo = CheckVoide(eName, eType, cName, cLength);
                if (isGo) {
                    mess += eName + "_" + eType + "_" + cName + "_" + cLength + "|";
                }
            });
            var go = confirm("确认添加添加后不得修改");
            if (go) {
                var tableName = $("#hiddTableName").val();//英文名称
                var tableCName = $("#txtCName").val();//中文名称;
                $.post("Ajax/CreatInfoToXML.ashx", { tableName: tableName, tableCName: tableCName, mess: mess }, function () {

                });
            }

        });


    });
    //检查数据是否为空
    function CheckVoide(eName, eType, cName, cLength) {
        if (eName == "" || eType == "" || cName == "" || cLength == "") {
            return false;
        } else if (eName != "" || eType != "" || cName != "" || cLength != "") {
            return true;
        }
    }
</script>
