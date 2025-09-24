<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="visualizar_usuario.aspx.cs" Inherits="visualizar_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Gerenciar Usuários</h2>

    <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="id_usuario"
        OnRowEditing="gridUsuarios_RowEditing"
        OnRowCancelingEdit="gridUsuarios_RowCancelingEdit"
        OnRowUpdating="gridUsuarios_RowUpdating"
        OnRowDeleting="gridUsuarios_RowDeleting"
        Width="100%" GridLines="Both">
        <Columns>
            <asp:BoundField DataField="id_usuario" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="username" HeaderText="Usuário" />
            <asp:BoundField DataField="nome" HeaderText="Nome" />
            <asp:BoundField DataField="cpf" HeaderText="CPF" />
            <asp:BoundField DataField="sexo" HeaderText="Genero" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="telefone" HeaderText="Telefone" />
            <asp:BoundField DataField="tipousuario" HeaderText="Tipo de usuario" /> 
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>

