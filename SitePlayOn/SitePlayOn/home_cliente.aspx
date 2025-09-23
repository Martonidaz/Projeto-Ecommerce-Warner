<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="Home_cliente.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <div class="container header-content">
            <div class="logo">
                <img src="src/assets/playonlogo.png" class="logo-img">
                <h1>Play On</h1>
            </div>
            <nav>
                <ul>
                    <asp:Button ID="btnHome" OnClick="btnHome_click" runat="server" Text="Início" style="height: 26px" />
                    <asp:Button ID="btnProdutos" OnClick="btnProdutos_click" runat="server" Text="Jogos" />  
                    <asp:Button ID="btnCategoria" OnClick="btnCategoria_click" runat="server" Text="Categorias" />    
                    <asp:Button ID="btnOfertas" OnClick="btnOfertas_click" runat="server" Text="Ofertas" /> 
                    <asp:Button ID="btnContato" OnClick="btnContato_click" runat="server" Text="Contato" />                   
                    <asp:Button ID="btnLogout" OnClick="btnLogout_click" runat="server" Text="Sair" />
                    <li>
                    <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
</asp:Content>

