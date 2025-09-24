<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TelaInicio.aspx.cs" Inherits="TelaInicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlayOn - Sua Loja de Jogos</title>
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
        
        /* Banner principal */
        .hero-banner {
            background: linear-gradient(rgba(15, 15, 27, 0.7), rgba(15, 15, 27, 0.9)), 
                        url('https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 80vh;
            display: flex;
            align-items: center;
            margin-top: 70px;
            text-align: center;
        }
        
        .hero-content h2 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }
        
        .hero-content p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
            color: #b8b8d0;
        }
        
        /* Seções */
        section {
            padding: 80px 0;
        }
        
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            position: relative;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        /* Categorias */
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
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid #3a3a52;
        }
        
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            border-color: #6a11cb;
        }
        
        .category-icon {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        
        .category-info h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #ffffff;
        }
        
        .category-info p {
            color: #b8b8d0;
            font-size: 0.9rem;
        }
        
        /* Produtos em destaque */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }
        
        .product-card {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid #3a3a52;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            border-color: #6a11cb;
        }
        
        .product-image {
            height: 200px;
            overflow: hidden;
        }
        
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .product-card:hover .product-image img {
            transform: scale(1.05);
        }
        
        .product-info {
            padding: 20px;
        }
        
        .product-info h3 {
            font-size: 1.3rem;
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
            margin-bottom: 20px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 60px;
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
            border: none;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        /* Newsletter */
        .newsletter {
            background: linear-gradient(90deg, #1a1a2e 0%, #16213e 100%);
            text-align: center;
            padding: 60px 0;
        }
        
        .newsletter h2 {
            font-size: 2rem;
            margin-bottom: 15px;
        }
        
        .newsletter p {
            color: #b8b8d0;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .newsletter-form {
            display: flex;
            max-width: 500px;
            margin: 0 auto;
            gap: 10px;
        }
        
        .newsletter-form input {
            flex: 1;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 1rem;
        }
        
        .newsletter-form input::placeholder {
            color: #b8b8d0;
        }
        
        .newsletter-form button {
            padding: 12px 25px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .newsletter-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
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
            }
            
            .hero-content h2 {
                font-size: 2.5rem;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .category-grid, .products-grid {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 480px) {
            .hero-content h2 {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Cabeçalho -->
<<<<<<< Updated upstream
            <header>
                <div class="container header-content">
                    <div class="logo">
                        <img src="../scr/assets/playonlogo.png" class="logo-img"/>
                        <h1>Play On</h1>
                    </div>
                    <nav>
                        <ul>
                            <li><a href="TelaInicio.aspx">Página Inicial</a></li>
                            <li><a href="Produtos.aspx">Jogos</a></li>
                            <li><a href="Sobre.aspx">Sobre Nós</a></li>                          
                            <li><a href="Login.aspx">Login</a></li>
                        </ul>        
                    </nav>
=======
        <header>
            <div class="container header-content">
                <div class="logo">
                    <img src="../scr/assets/playonlogo.png" class="logo-img" alt="PlayOn Logo"/>
                    <h1>Play On</h1>
>>>>>>> Stashed changes
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
    </form>

    <!-- Banner principal -->
    <section class="hero-banner">
        <div class="container hero-content">
            <h2>Jogos a Preços Acessíveis</h2>
            <p>Encontre os melhores títulos dos games com garantia e entrega rápida</p>
        </div>
    </section>

    <!-- Categorias -->
    <section class="categories">
        <div class="container">
            <h2 class="section-title">Gêneros de Jogos</h2>
            <div class="category-grid">
                <div class="category-card">
                    <div class="category-icon">🧟</div>
                    <div class="category-info">
                        <h3>Terror</h3>
                        <p>Terror, Sobrevivência, Suspense, Medo, Horror, Assustador, Sobrenatural, Tensão, Zumbi</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🔫</div>
                    <div class="category-info">
                        <h3>Tiro</h3>
                        <p>FPS (First-Person Shooter), TPS (Third-Person Shooter), Combate, Ação, Guerra, Armas, Estratégia, Preciso.</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🏎️</div>
                    <div class="category-info">
                        <h3>Corrida</h3>
                        <p>Velocidade, Simulação, Arcade, Carro, Moto, Circuito, Piloto, Competição, Adrenalina.</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🧙</div>
                    <div class="category-info">
                        <h3>Aventura</h3>
                        <p> Exploração, Narrativa, Quebra-cabeça, História, RPG, Mundo Aberto, Ficção, Jornada.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Jogos em destaque -->
    <section class="featured-products">
        <div class="container">
            <h2 class="section-title">Jogos em Destaque</h2>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">
                        <img src="scr/assets/icone_terror.png" alt="Dead By Daylight"/>
                    </div>
                    <div class="product-info">
                        <h3>Dead By Daylight</h3>
                        <p class="product-price">R$ 19,99</p>
                        <p class="product-description">Requisitos Mínimos
                                Sistema Operacional: Windows® 10/11 64 bits
                                Processador: Intel® Core™ i3-4170 ou equivalente
                                Memória: 8 GB de RAM
                                Placa de vídeo: Placa gráfica compatível com DirectX 11, como a GeForce® GTX 460 1GB ou superior
                                DirectX: Versão 11
                                Armazenamento: 50 GB de espaço disponível</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <img src="scr/assets/icone_tiro.png" alt="Call of Duty Modern Warfare II"/>
                    </div>
                    <div class="product-info">
                        <h3>Call of Duty Modern Warfare® II</h3>
                        <p class="product-price">R$ 319,00</p>
                        <p class="product-description">Requer um processador e sistema operacional de 64 bits
                        SO: Windows® 10 64 Bit (atualização mais recente)
                        Processador: Intel® Core™ i3-6100 / Core™ i5-2500K ou AMD Ryzen™ 3 1200
                        Memória: 8 GB de RAM
                        Placa de vídeo: NVIDIA® GeForce® GTX 960 ou AMD Radeon™ RX 470 - Sistema compatível com DirectX 12.0
                        DirectX: Versão 12
                        Rede: Conexão de internet banda larga
                        Armazenamento: 125 GB de espaço disponível</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <img src="scr/assets/icone_corrida.png" alt="Need For Speed Payback"/>
                    </div>
                    <div class="product-info">
                        <h3>Need For Speed Payback</h3>
                        <p class="product-price">R$ 7,79</p>
                        <p class="product-description">
                            Requisitos Mínimos
                            Sistema Operacional: Windows® 7 64 bits ou superior
                            Processador: Intel® i3 6300 @ 3,8 GHz ou AMD® FX 8150 @ 3.6GHz com 4 threads de hardware
                            Memória: 6 GB de RAM
                            Placa de vídeo: NVIDIA® GeForce® GTX 750 Ti ou AMD® Radeon™ HD 7850 ou GPU compatível com DX11 e 2GB de memória
                            DirectX: Versão 11, placa de vídeo compatível
                            Armazenamento: 30 GB de espaço disponível</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <img src="scr/assets/icone_aventura.png" alt="The Elder Scrolls Online"/>
                    </div>
                    <div class="product-info">
                        <h3>The Elder Scrolls Online</h3>
                        <p class="product-price">R$ 61,50</p>
                        <p class="product-description">Requisitos Mínimos
                        Sistema Operacional: Windows® 10 64 bits
                        Processador: Intel® Core™ i5 2300 ou AMD® FX4350
                        Memória: 4 GB de RAM
                        Placa de vídeo: Placa de vídeo compatível com DirectX 11.0 e 1GB de RAM (NVIDIA® GeForce® 560 ou AMD® Radeon™ 6870)
                        DirectX: Versão 11
                        Rede: Conexão de internet banda larga
                        Armazenamento: 150 GB de espaço disponível</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Newsletter -->
    <section class="newsletter">
        <div class="container">
            <h2>Fique por dentro das novidades</h2>
            <p>Cadastre-se para receber promoções exclusivas e novidades em primeira mão</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Seu melhor e-mail" required>
                <button type="submit">Inscrever</button>
            </form>
        </div>
    </section>

    <!-- Rodapé -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Play On</h3>
                    <p>Sua loja de confiança para jogos.</p>
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
                    <h3>Gêneros</h3>
                    <ul>
                        <li><a href="#">Terror</a></li>
                        <li><a href="#">Tiro</a></li>
                        <li><a href="#">Corrida</a></li>
                        <li><a href="#">Aventura</a></li>
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
                <p>&copy; 2025 Play On - Todos os direitos reservados</p>
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

        // Validação do formulário de newsletter
        document.querySelector('.newsletter-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = this.querySelector('input[type="email"]').value;
            
            if (email && email.includes('@')) {
                alert('Obrigado por se inscrever em nossa newsletter!');
                this.reset();
            } else {
                alert('Por favor, insira um e-mail válido.');
            }
        });
    </script>
</body>
</html>