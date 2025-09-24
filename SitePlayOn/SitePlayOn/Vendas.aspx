<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="Vendas.aspx.cs" Inherits="carrinho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Sistema de Vendas</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="width:80%; margin:auto;">

            <h2>Jogos Disponíveis</h2>
            <asp:GridView ID="gridJogos" runat="server" AutoGenerateColumns="false" OnRowCommand="gridJogos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id_jogo" HeaderText="ID" />
                    <asp:BoundField DataField="nome" HeaderText="Nome do Jogo" />
                    <asp:BoundField DataField="preco" HeaderText="Preço" DataFormatString="{0:C}" />
                    <asp:ButtonField ButtonType="Button" Text="Adicionar" CommandName="Adicionar" />
                </Columns>
            </asp:GridView>

            <h2>Carrinho</h2>
            <asp:GridView ID="gridCarrinho" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Jogo" />
                    <asp:BoundField DataField="PrecoUnitario" HeaderText="Preço Unitário" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>

            <h3>Total: <asp:Label ID="lblTotal" runat="server" Text="0,00" /></h3>

            <h3>Tipo de Pagamento</h3>
            <asp:DropDownList ID="ddlTipoPagamento" runat="server"></asp:DropDownList>

            <br /><br />
            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Venda" OnClick="btnFinalizar_Click" />
            <br /><br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>

        </div>
</asp:Content>

