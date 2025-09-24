<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="ConfirmarCompra.aspx.cs" Inherits="ConfirmarCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .confirmation-container {
            max-width: 500px;
            margin: 120px auto 50px;
            padding: 30px;
            background: rgba(42, 42, 60, 0.8);
            border-radius: 10px;
            border: 1px solid #3a3a52;
            text-align: center;
        }

        .product-info {
            margin-bottom: 20px;
            padding: 20px;
            background: rgba(30, 30, 45, 0.6);
            border-radius: 8px;
        }

        .product-image {
            max-width: 200px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 1.4rem;
            margin-bottom: 10px;
            color: #ffffff;
        }

        .product-price {
            font-size: 1.8rem;
            color: #6a11cb;
            font-weight: bold;
            margin: 15px 0;
        }

        .btn-confirm {
            background: linear-gradient(90deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            margin: 10px;
            transition: all 0.3s;
        }

        .btn-confirm:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
        }

        .btn-cancel {
            background: linear-gradient(90deg, #dc3545 0%, #e83e8c 100%);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
        }

        .btn-cancel:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
        }

        .success-message {
            background: rgba(40, 167, 69, 0.2);
            border: 1px solid #28a745;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .error-message {
            background: rgba(220, 53, 69, 0.2);
            border: 1px solid #dc3545;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="confirmation-container">
        <h2>Confirmar Compra</h2>
        
        <!-- Detalhes do Produto -->
        <asp:Panel ID="pnlDetalhes" runat="server" Visible="false">
            <div class="product-info">
                <asp:Image ID="imgProduto" runat="server" CssClass="product-image" />
                <div class="product-name">
                    <asp:Label ID="lblNome" runat="server"></asp:Label>
                </div>
                <div class="product-price">
                    <asp:Label ID="lblPreco" runat="server"></asp:Label>
                </div>
            </div>

            <!-- Botões de Confirmação -->
            <asp:Button ID="btnConfirmarCompra" runat="server" Text="✅ Confirmar Compra" 
                CssClass="btn-confirm" OnClick="btnConfirmarCompra_Click" />
            <br />
            <a href="Produtos.aspx" class="btn-cancel">❌ Cancelar</a>
        </asp:Panel>

        <!-- Mensagem de Sucesso -->
        <asp:Panel ID="pnlSucesso" runat="server" Visible="false" CssClass="success-message">
            <h3>🎉 Compra Realizada com Sucesso!</h3>
            <p>Obrigado pela sua compra!</p>
            <p><strong>Número da Venda:</strong> <asp:Label ID="lblNumeroVenda" runat="server" Font-Bold="true" ForeColor="#6a11cb"></asp:Label></p>
            <p><strong>Produto:</strong> <asp:Label ID="lblProdutoSucesso" runat="server"></asp:Label></p>
            <p><strong>Valor Total:</strong> <asp:Label ID="lblValorSucesso" runat="server"></asp:Label></p>
            <p><strong>Data:</strong> <asp:Label ID="lblDataSucesso" runat="server"></asp:Label></p>
            <a href="Produtos.aspx" class="btn-confirm">⬅ Voltar aos Produtos</a>
        </asp:Panel>

        <!-- Mensagem de Erro -->
        <asp:Panel ID="pnlErro" runat="server" Visible="false" CssClass="error-message">
            <h3>❌ Erro na Compra</h3>
            <p><asp:Label ID="lblErro" runat="server"></asp:Label></p>
            <a href="Produtos.aspx" class="btn-cancel">Voltar aos Produtos</a>
        </asp:Panel>
    </div>
</asp:Content>

