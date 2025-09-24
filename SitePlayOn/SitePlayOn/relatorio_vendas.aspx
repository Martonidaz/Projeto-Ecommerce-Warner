<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="relatorio_vendas.aspx.cs" Inherits="relatorio_vendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .relatorio-container {
            margin: 120px auto 50px;
            padding: 20px;
            max-width: 1200px;
        }

        .filtros {
            background: rgba(42, 42, 60, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .filtro-group {
            display: inline-block;
            margin-right: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            padding: 8px;
            border: 1px solid #3a3a52;
            border-radius: 5px;
            background: #2a2a3c;
            color: white;
        }

        .btn-filtrar {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .resumo-vendas {
            background: rgba(42, 42, 60, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .resumo-item {
            display: inline-block;
            margin-right: 30px;
            text-align: center;
        }

        .resumo-valor {
            font-size: 1.5em;
            font-weight: bold;
            color: #6a11cb;
        }

        .grid-vendas {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .grid-vendas th {
                background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
                padding: 12px;
                text-align: left;
            }

            .grid-vendas td {
                padding: 10px;
                border-bottom: 1px solid #3a3a52;
            }

            .grid-vendas tr:hover {
                background: rgba(106, 17, 203, 0.1);
            }

        .sem-registros {
            text-align: center;
            padding: 40px;
            color: #b8b8d0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="relatorio-container">
        <h2>📊 Relatório de Vendas</h2>
        
        <!-- Filtros -->
        <div class="filtros">
            <div class="filtro-group">
                <label class="form-label">Data Início</label>
                <asp:TextBox ID="txtDataInicio" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="filtro-group">
                <label class="form-label">Data Fim</label>
                <asp:TextBox ID="txtDataFim" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="filtro-group">
                <label class="form-label">&nbsp;</label>
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn-filtrar" OnClick="btnFiltrar_Click" />
            </div>
        </div>

        <!-- Resumo -->
        <div class="resumo-vendas">
            <div class="resumo-item">
                <div>Total de Vendas</div>
                <div class="resumo-valor">
                    <asp:Label ID="lblTotalVendas" runat="server" Text="0"></asp:Label>
                </div>
            </div>
            <div class="resumo-item">
                <div>Valor Total</div>
                <div class="resumo-valor">
                    <asp:Label ID="lblValorTotal" runat="server" Text="R$ 0,00"></asp:Label>
                </div>
            </div>
            <div class="resumo-item">
                <div>Ticket Médio</div>
                <div class="resumo-valor">
                    <asp:Label ID="lblTicketMedio" runat="server" Text="R$ 0,00"></asp:Label>
                </div>
            </div>
        </div>

        <!-- Grid de Vendas -->
        <asp:GridView ID="gvVendas" runat="server" AutoGenerateColumns="false" CssClass="grid-vendas"
            EmptyDataText="Nenhuma venda encontrada" OnRowDataBound="gvVendas_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id_venda" HeaderText="Nº Venda" />
                <asp:BoundField DataField="data_venda" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                <asp:BoundField DataField="nome_cliente" HeaderText="Cliente" />
                <asp:BoundField DataField="valor_total" HeaderText="Valor" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>

        <asp:Button ID="SairVendas" runat="server" Text="Home Admin" OnClick="SairVendas_Click" />

        <!-- Mensagem sem registros -->
        <asp:Panel ID="pnlSemRegistros" runat="server" Visible="false" CssClass="sem-registros">
            <h3>📭 Nenhuma venda encontrada</h3>
            <p>Não há vendas registradas no período selecionado.</p>
        </asp:Panel>
    </div>
</asp:Content>

