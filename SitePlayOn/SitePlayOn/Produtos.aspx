<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head runat="server">
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
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Cabeçalho -->
        <header>
            <div class="container header-content">
                <div class="logo">
                    <h1>Play On</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="TelaInicio.aspx">Página Inicial</a></li>
                        <li><a href="Produtos.aspx">Jogos</a></li>
                        <li><a href="Categoria.aspx">Categoria</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- Conteúdo principal -->
        <main class="container">
            <h2 class="section-title">Nossos Produtos</h2>

            <div class="products-grid">
                <!-- Cards de exemplo. Substitua pelo conteúdo dinâmico/servidor -->
                <div class="product-card">
                    <img src="https://via.placeholder.com/250x150" alt="Produto 1" />
                    <div class="product-name">Jogo 1</div>
                    <div class="product-price">R$ 59,90</div>
                    <a href="#" class="btn">Comprar</a>
                </div>
                <div class="product-card">
                    <img src="https://via.placeholder.com/250x150" alt="Produto 2" />
                    <div class="product-name">Jogo 2</div>
                    <div class="product-price">R$ 79,90</div>
                    <a href="#" class="btn">Comprar</a>
                </div>
                <div class="product-card">
                    <img src="https://via.placeholder.com/250x150" alt="Produto 3" />
                    <div class="product-name">Jogo 3</div>
                    <div class="product-price">R$ 99,90</div>
                    <a href="#" class="btn">Comprar</a>
                </div>
            </div>
        </main>

        <!-- Rodapé -->
        <footer>
            &copy; 2025 Play On - Todos os direitos reservados
        </footer>
    </form>
</body>
</html>
