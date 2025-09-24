<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!DOCTYPE html>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Produtos - Play On</title>
    <style>
        /* ===== Estilo base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #0f0f1b;
            color: #ffffff;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* ===== Cabeçalho ===== */
        header {
            background-color: rgba(15, 15, 27, 0.95);
            backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid #2a2a3c;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo h1 {
            font-size: 24px;
            font-weight: 700;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        nav ul {
            display: flex;
            list-style: none;
            gap: 30px;
            align-items: center;
        }

        nav a {
            color: #b8b8d0;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            position: relative;
            padding: 5px 0;
        }

        nav a:hover {
            color: #ffffff;
        }

        nav a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            transition: width 0.3s;
        }

        nav a:hover::after {
            width: 100%;
        }

        /* ===== Barra de Pesquisa ===== */
        .search-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        .search-input {
            background: rgba(42, 42, 60, 0.8);
            border: 1px solid #3a3a52;
            border-radius: 20px;
            padding: 8px 15px;
            color: #ffffff;
            width: 200px;
            transition: all 0.3s;
        }

        .search-input:focus {
            outline: none;
            width: 250px;
            border-color: #6a11cb;
            box-shadow: 0 0 5px rgba(106, 17, 203, 0.5);
        }

        .search-btn {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            border: none;
            border-radius: 20px;
            color: white;
            padding: 8px 15px;
            margin-left: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }

        /* ===== Grid de Produtos ===== */
        main {
            margin-top: 120px;
        }

        h2.section-title {
            font-size: 2rem;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }

        h2.section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .product-card {
            background: rgba(42, 42, 60, 0.6);
            border: 1px solid #3a3a52;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.4);
        }

        .product-card img {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 1.2rem;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .product-price {
            color: #6a11cb;
            font-size: 1.1rem;
            margin-bottom: 15px;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }

        /* ===== Mensagem de nenhum resultado ===== */
        .no-results {
            text-align: center;
            padding: 40px;
            font-size: 1.2rem;
            color: #b8b8d0;
            grid-column: 1 / -1;
        }

        /* ===== Rodapé ===== */
        footer {
            background: #0a0a14;
            padding: 60px 0 20px;
            margin-top: 60px;
            color: #b8b8d0;
            text-align: center;
            border-top: 1px solid #2a2a3c;
        }

        @media (max-width: 768px) {
            nav ul { gap: 15px; }
            h2.section-title { font-size: 1.8rem; }
            .search-input {
                width: 150px;
            }
            .search-input:focus {
                width: 180px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<body>
        <!-- Cabeçalho -->
        <header>
            <div class="container header-content">
                <div class="logo">
                    <h1>Play On</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="Home_cliente.aspx">Página Inicial</a></li>
                        <li><a href="Produtos.aspx">Jogos</a></li>
                        <li><a href="Categoria.aspx">Categoria</a></li>
                        <li>
                            <div class="search-container">
                                <input type="text" id="searchInput" class="search-input" placeholder="Buscar jogos..." />
                                <button id="searchBtn" class="search-btn">Buscar</button>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- Conteúdo principal -->
        <main>
            <div class="container">
                <h2 class="section-title">Nossos Jogos</h2>
                <div class="products-grid" id="productsGrid">
                    <asp:Repeater ID="rptProdutos" runat="server">
                        <ItemTemplate>
                            <div class="product-card" data-name='<%# Eval("Nome") %>'>
                                <img src='Imagens/Produtos/<%# Eval("id_jogo") %>.jpg' 
                                     alt='<%# Eval("Nome") %>'
                                     onerror="this.src='Imagens/Produtos/padrao.jpg'" />
                                <div class="product-name"><%# Eval("Nome") %></div>
                                <div class="product-price">R$ <%# Convert.ToDecimal(Eval("Preco")).ToString("N2") %></div>
                                <a href='ConfirmarCompra.aspx?id=<%# Eval("id_jogo") %>' class="btn">Comprar</a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </main>

        <!-- Rodapé -->
        <footer>
            &copy; 2025 Play On - Todos os direitos reservados
        </footer>

        <script>
            // Função de pesquisa
            document.addEventListener('DOMContentLoaded', function() {
                const searchInput = document.getElementById('searchInput');
                const searchBtn = document.getElementById('searchBtn');
                const productCards = document.querySelectorAll('.product-card');
                
                // Função para filtrar produtos
                function filterProducts() {
                    const searchTerm = searchInput.value.toLowerCase().trim();
                    let hasResults = false;
                    
                    productCards.forEach(card => {
                        const productName = card.getAttribute('data-name').toLowerCase();
                        
                        if (productName.includes(searchTerm)) {
                            card.style.display = 'block';
                            hasResults = true;
                        } else {
                            card.style.display = 'none';
                        }
                    });
                    
                    // Mostrar mensagem se não houver resultados
                    const noResultsMsg = document.getElementById('noResultsMsg');
                    if (!hasResults) {
                        if (!noResultsMsg) {
                            const msg = document.createElement('div');
                            msg.id = 'noResultsMsg';
                            msg.className = 'no-results';
                            msg.textContent = 'Nenhum jogo encontrado para "' + searchTerm + '"';
                            document.getElementById('productsGrid').appendChild(msg);
                        } else {
                            noResultsMsg.textContent = 'Nenhum jogo encontrado para "' + searchTerm + '"';
                            noResultsMsg.style.display = 'block';
                        }
                    } else if (noResultsMsg) {
                        noResultsMsg.style.display = 'none';
                    }
                }
                
                // Event listeners
                searchBtn.addEventListener('click', filterProducts);
                
                searchInput.addEventListener('keyup', function(event) {
                    if (event.key === 'Enter') {
                        filterProducts();
                    }
                });
                
                searchInput.addEventListener('input', filterProducts);
            });
        </script>
</body>
</asp:Content>