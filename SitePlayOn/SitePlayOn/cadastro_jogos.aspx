<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="cadastro_jogos.aspx.cs" Inherits="cadastro_jogos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtnomeJogo" runat="server" Placeholder="Nome do Jogo"></asp:TextBox>
    <asp:TextBox ID="txtdescriçãoJogo" runat="server" Placeholder="Descrição"></asp:TextBox>
    <asp:TextBox ID="data_lancamento" runat="server" Placeholder="Nome do Jogo" textMode="Date"></asp:TextBox>
    <asp:TextBox ID="precoJogo" runat="server" Placeholder="Valor"></asp:TextBox>
    <asp:TextBox ID="txttamanhoJogo" runat="server" Placeholder="Tamanho"></asp:TextBox>
    <asp:DropDownList ID="ddlDesenvolvedora" runat="server" nome=""></asp:DropDownList>
    <asp:DropDownList ID="ddlPublicadora" runat="server" nome=""></asp:DropDownList>
    <asp:DropDownList ID="ddlClassificacao" runat="server" nome=""></asp:DropDownList>
    <asp:DropDownList ID="ddlGenero" runat="server" nome=""></asp:DropDownList>
    <asp:DropDownList ID="ddlPlataforma" runat="server" nome=""></asp:DropDownList>
    <asp:Button ID="btnConfirmaJogo" runat="server" Text="Confirmar Cadastro" OnClick="btnConfirmaJogo_Click" />
    <asp:Label ID="lblValidaJogo" runat="server" Text=""></asp:Label>
    
</asp:Content>

