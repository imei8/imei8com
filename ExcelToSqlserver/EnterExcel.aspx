<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterExcel.aspx.cs" Inherits="ExcelToSqlserver.EnterExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EXCEL数据导入</title>
    <script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        当前位置Excel数据操作<br />
        <br />
        导入数据：<br />
        <br />
        选择EXCEL数据表：<asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        选择数据表：<asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="158px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnCheck" runat="server" Text="检查" OnClick="btnCheck_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnOK" runat="server" Text="确认导入" OnClick="btnOK_Click" />
    </div>
    </form>
</body>
</html>

