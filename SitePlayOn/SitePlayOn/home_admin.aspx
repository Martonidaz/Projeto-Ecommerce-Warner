<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Home_admin.aspx.cs" Inherits="Home_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnCadastroUsuario" runat="server" Text="Cadastrar Usuáro" OnClick="btnCadastroUsuario_Click" />
    <asp:Button ID="btnCadastrarJogo" runat="server" Text="Cadastrar Jogo" />
    <asp:Button ID="btnCadastrarPlataformas" runat="server" Text="Cadastrar Plataformas" />

    <asp:Button ID="btnVisualizarUsuarios" runat="server" Text="Visualizar Usuários" />
    <asp:Button ID="btnVisualizarJogos" runat="server" Text="Visualizar Jogos Cadastrados" />
    <asp:Button ID="btnVisualizarPlataformas" runat="server" Text="Visualizar Palataformas cadastradas" />
</asp:Content>

