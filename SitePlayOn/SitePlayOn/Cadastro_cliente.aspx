<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro_cliente.aspx.cs" Inherits="Cadastro_cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtUser" runat="server" Placeholder="Nome de usuário"></asp:TextBox>
            <asp:TextBox ID="txtSenha" runat="server" Placeholder="Senha" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtNome" runat="server" Placeholder="Seu Nome"></asp:TextBox>
            <asp:TextBox ID="txtCPF" runat="server" Placeholder="CPF"></asp:TextBox>          
            <asp:DropDownList ID="listgen" runat="server" Placeholder="Genero">
                <asp:ListItem Text="Mascuino" Value="M" />
                <asp:ListItem Text="Feminino" Value="F" />
            </asp:DropDownList>
            <asp:TextBox ID="txtData" runat="server" TextMode="Date" Placeholder="Data de Nascimento"></asp:TextBox>
            <asp:TextBox ID="txtTel" runat="server" Placeholder="Telefone" TextMode="Phone"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" TextMode="Email"></asp:TextBox>
            <asp:Button ID="btnConfirma" runat="server" Text="Confirmar dados" OnClick="btnConfirma_Click" />
            <asp:Label ID="lblCadastro" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnVoltar" runat="server" Text="Inicio" OnClick="btnVoltar_Click" />
        </div>
    </form>
</body>
</html>
