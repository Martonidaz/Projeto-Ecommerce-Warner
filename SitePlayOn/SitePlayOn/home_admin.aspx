<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Home_admin.aspx.cs" Inherits="Home_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="menu-admin">
        <asp:Button ID="btnCadastroUsuario" runat="server" Text="Cadastrar Usuário" OnClick="btnCadastroUsuario_Click" />
        <asp:Button ID="btnCadastrarJogo" runat="server" Text="Cadastrar Jogo" OnClick="btnCadastrarJogo_Click" />
        <asp:Button ID="btnCadastrarPlataformas" runat="server" Text="Cadastrar Plataformas" />
        <asp:Button ID="btnTelaCliente" runat="server" Text="Tela Cliente" OnClick="btnTelaCliente_Click" />

        <asp:Button ID="btnVisualizarUsuarios" runat="server" Text="Visualizar Usuários" OnClick="btnVisualizarUsuarios_Click" />
        <asp:Button ID="btnVisualizarJogos" runat="server" Text="Visualizar Jogos Cadastrados" />
        <asp:Button ID="btnVisualizarPlataformas" runat="server" Text="Visualizar Plataformas Cadastradas" />
        <asp:Button ID="btnSairAdmin" runat="server" Text="Sair" OnClick="btnSairAdmin_Click" />
    </div>
</asp:Content>

