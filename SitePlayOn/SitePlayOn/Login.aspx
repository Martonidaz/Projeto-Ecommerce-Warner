<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtLogin" runat="server" Placeholder="Username" ></asp:TextBox>
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Placeholder="Insira sua senha" ></asp:TextBox>
            <asp:Label ID="lblValida" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click"  />
        </div>
    </form>
</body>
</html>
