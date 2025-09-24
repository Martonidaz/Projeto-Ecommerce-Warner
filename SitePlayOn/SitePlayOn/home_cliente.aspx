<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="Home_cliente.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Play On - Sua Loja de Jogos</title>
    <style>
        /* Reset e configurações gerais */
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
        
        /* Cabeçalho */
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
        
        .logo-img {
            height: 40px;
            width: auto;
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
        
        /* Botões personalizados */
        #btnLogout {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 0.9rem;
        }
        
        #btnLogout:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        /* Banner principal */
        .hero-banner {
            background: linear-gradient(135deg, rgba(106, 17, 203, 0.8), rgba(37, 117, 252, 0.8)),
                       url('https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            padding: 180px 0 100px;
            text-align: center;
            margin-top: 70px;
        }
        
        .hero-content h2 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        
        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: #e0e0ff;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .btn {
            display: inline-block;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 15px 30px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            font-size: 1.1rem;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        /* Categorias */
        .categories {
            padding: 80px 0;
        }
        
        .section-title {
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 50px;
            position: relative;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .category-card {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            border: 1px solid #3a3a52;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(106, 17, 203, 0.3);
        }
        
        .category-icon {
            font-size: 3rem;
            margin-bottom: 15px;
        }
        
        .category-info h3 {
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: #ffffff;
        }
        
        .category-info p {
            color: #b8b8d0;
            font-size: 0.9rem;
        }
        
        /* Produtos em destaque */
        .featured-products {
            padding: 80px 0;
            background: rgba(10, 10, 20, 0.5);
        }
        
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }
        
        .product-card {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #3a3a52;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(106, 17, 203, 0.3);
        }
        
        .product-image {
            height: 200px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .product-info {
            padding: 20px;
        }
        
        .product-info h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #ffffff;
        }
        
        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #6a11cb;
            margin-bottom: 10px;
        }
        
        .product-description {
            color: #b8b8d0;
            font-size: 0.9rem;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        
        /* Rodapé */
        footer {
            background: #0a0a14;
            padding: 60px 0 20px;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .footer-section h3 {
            font-size: 1.3rem;
            margin-bottom: 20px;
            color: #ffffff;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-section h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .footer-section p, .footer-section li {
            color: #b8b8d0;
            margin-bottom: 10px;
        }
        
        .footer-section ul {
            list-style: none;
        }
        
        .footer-section a {
            color: #b8b8d0;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-section a:hover {
            color: #6a11cb;
        }
        
        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transition: all 0.3s;
            font-size: 1.2rem;
            text-decoration: none;
        }
        
        .social-icons a:hover {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            transform: translateY(-3px);
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #2a2a3c;
            color: #b8b8d0;
            font-size: 0.9rem;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }
            
            nav ul {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .hero-content h2 {
                font-size: 2rem;
            }
            
            .hero-banner {
                padding: 120px 0 80px;
                margin-top: 120px;
            }
            
            .section-title {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 480px) {
            .hero-content h2 {
                font-size: 1.8rem;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
            
            .category-grid,
            .products-grid {
                grid-template-columns: 1fr;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
            }
        }

        /* Estilo para o label de boas-vindas */
        #lblWelcome {
            color: #6a11cb;
            font-weight: 600;
            font-size: 0.9rem;
            background: rgba(106, 17, 203, 0.1);
            padding: 5px 10px;
            border-radius: 15px;
            border: 1px solid #6a11cb;
        }
    </style>
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <div class="container header-content">
            <div class="logo">
                <img src="../scr/assets/playonlogo.png" alt="Play On Logo" class="logo-img">
                <h1>Play On</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="Home_cliente.aspx" style="color: #ffffff;">Página Inicial</a></li>                    
                    <li><a href="Produtos.aspx">Produtos</a></li>
                    <li><a href="Categoria.aspx">Categoria</a></li>                                               
                    <li><a href="Categoria.aspx">Categoria</a></li>       
                    <li><a href="Cadastro_cliente.aspx">Cadastrar</a></li>           
                    <li><asp:Button ID="btnLogout" OnClick="btnLogout_click" runat="server" Text="Sair" CssClass="btn-logout" /></li>
                    <li><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></li>

                </ul>
            </nav>
        </div>
    </header>

    <!-- Banner principal -->
    <section class="hero-banner">
        <div class="container hero-content">
            <h2>Tecnologia de Ponta a Preços Acessíveis</h2>
            <p>Encontre os melhores jogos e produtos de informática com garantia e entrega rápida</p>
            <a href="Produtos.aspx" class="btn">Ver Ofertas</a>
        </div>
    </section>

    <section class="categories">
        <div class="container">
            <h2 class="section-title">Categorias de Jogos</h2>
            <div class="category-grid">
                <div class="category-card">
                    <div class="category-icon">🎮</div>
                    <div class="category-info">
                        <h3>Ação e Aventura</h3>
                        <p>Jogos emocionantes e cheios de adrenalina</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🏆</div>
                    <div class="category-info">
                        <h3>Esportes</h3>
                        <p>Simulações realistas e competições</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🧩</div>
                    <div class="category-info">
                        <h3>Estratégia</h3>
                        <p>Desafios mentais e planejamento</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">👻</div>
                    <div class="category-info">
                        <h3>Terror</h3>
                        <p>Experiências intensas e assustadoras</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Produtos em destaque -->
    <section class="featured-products">
        <div class="container">
            <h2 class="section-title">Jogos em Destaque</h2>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">
                        <div>Dead By Daylight</div>
                    </div>
                    <div class="product-info">
                        <h3>Dead By Daylight</h3>
                        <p class="product-price">R$ 19,99</p>
                        <p class="product-description">Horror de sobrevivência multijogador (4vs1) com diversos assassinos e sobreviventes</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>Cyberpunk 2077</div>
                    </div>
                    <div class="product-info">
                        <h3>Cyberpunk 2077</h3>
                        <p class="product-price">R$ 149,90</p>
                        <p class="product-description">RPG de mundo aberto em Night City, com história envolvente e gráficos impressionantes</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>FIFA 24</div>
                    </div>
                    <div class="product-info">
                        <h3>FIFA 24</h3>
                        <p class="product-price">R$ 249,90</p>
                        <p class="product-description">A experiência definitiva de futebol com times reais e jogabilidade aprimorada</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>Resident Evil 4</div>
                    </div>
                    <div class="product-info">
                        <h3>Resident Evil 4</h3>
                        <p class="product-price">R$ 199,90</p>
                        <p class="product-description">Remake do clássico de survival horror com gráficos modernos e jogabilidade atualizada</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Rodapé -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Play On</h3>
                    <p>Sua loja de confiança para produtos de informática e tecnologia.</p>
                </div>
                <div class="footer-section">
                    <h3>Links Rápidos</h3>
                    <ul>
                        <li><a href="#">Sobre nós</a></li>
                        <li><a href="#">Politica de privacidade</a></li>
                        <li><a href="#">Termos de uso</a></li>
                        <li><a href="#">Trocas e devoluções</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Categorias</h3>
                    <ul>
                        <li><a href="#">Ação</a></li>
                        <li><a href="#">Aventura</a></li>
                        <li><a href="#">Esportes</a></li>
                        <li><a href="#">Terror</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Contato</h3>
                    <ul>
                        <li>Email: contato@playon.com</li>
                        <li>Telefone: (11) 3456-7890</li>
                        <li>Endereço: Rua da Tecnologia, 123</li>
                    </ul>
                    <div class="social-icons">
                        <a href="#">📱</a>
                        <a href="#">💻</a>
                        <a href="#">📧</a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2023 Play On - Todos os direitos reservados</p>
            </div>
        </div>
    </footer>

    <script>
        // Efeito de rolagem suave para links internos
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Adicionar classe de destaque ao menu conforme a rolagem
        window.addEventListener('scroll', function() {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.style.background = 'rgba(15, 15, 27, 0.98)';
            } else {
                header.style.background = 'rgba(15, 15, 27, 0.95)';
            }
        });

        // Simulação de adição ao carrinho
        document.querySelectorAll('.product-card .btn').forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const productName = this.closest('.product-card').querySelector('h3').textContent;
                alert(productName + ' foi adicionado ao seu carrinho!');
            });
        });

        // Destacar link ativo no menu
        const currentPage = window.location.pathname.split('/').pop();
        document.querySelectorAll('nav a').forEach(link => {
            if (link.getAttribute('href') === currentPage) {
                link.style.color = '#ffffff';
            }
        });
    </script>
</asp:Content>