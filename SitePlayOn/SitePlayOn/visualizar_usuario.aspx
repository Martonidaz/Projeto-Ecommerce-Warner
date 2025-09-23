<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="visualizar_usuario.aspx.cs" Inherits="visualizar_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="id_cliente" ShowHeader="true" Width="99%" GridLines="Both" Height="286px">
    <Columns>
        <asp:BoundField DataField="id_cliente" HeaderText="ID" />
        <asp:BoundField DataField="nome" HeaderText="Nome" />
        <asp:BoundField DataField="cpf" HeaderText="CPF" />
        <asp:BoundField DataField="sexo" HeaderText="Genero" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="telefone" HeaderText="Telefone" />
        <asp:BoundField DataField="data_nascimento" HeaderText="Data de Nascimento" />
        <asp:BoundField DataField="data_cadastro" HeaderText="Data de cadastro" />    
    </Columns>
    </asp:GridView>
</asp:Content>

