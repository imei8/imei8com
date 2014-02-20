<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExcelToSqlserver.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>XML操作处理</title>
</head>
<body>
    <form id="form1" runat="server">
        中文表名：<asp:TextBox ID="txtCname" runat="server"></asp:TextBox>
        <br />
        <br />
        数据表名：<asp:TextBox ID="txtEName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" />
&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改" />
&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="删除" />
&nbsp;&nbsp;
        <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" Text="检查" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
