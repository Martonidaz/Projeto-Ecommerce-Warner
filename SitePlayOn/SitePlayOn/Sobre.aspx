<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sobre - PlayOn</title>
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
            margin-top: 100px;
            background: linear-gradient(rgba(15, 15, 27, 0.7), rgba(15, 15, 27, 0.9)), 
                        url('https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            text-align: center;
            border-bottom: 1px solid #2a2a3c;
        }
        
        .hero-content h2 {
            font-size: 3rem;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .hero-content p {
            font-size: 1.2rem;
            color: #b8b8d0;
            max-width: 600px;
            margin: 0 auto;
        }
        
        /* Seção sobre */
        .about-section {
            padding: 80px 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }
        
        .about-image {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        
        .about-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        .about-content h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .about-content h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .about-content p {
            color: #b8b8d0;
            margin-bottom: 30px;
            line-height: 1.8;
        }
        
        .team-list {
            list-style: none;
            margin-top: 20px;
        }
        
        .team-list li {
            padding: 12px 0;
            border-bottom: 1px solid #2a2a3c;
            color: #b8b8d0;
            position: relative;
            padding-left: 25px;
        }
        
        .team-list li::before {
            content: '🎮';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
        }
        
        .team-list li:last-child {
            border-bottom: none;
        }
        
        /* Newsletter */
        .newsletter {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            padding: 50px 30px;
            text-align: center;
            margin: 60px 0;
            border: 1px solid #3a3a52;
        }
        
        .newsletter h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
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
            padding: 15px 20px;
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
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            padding: 0 30px;
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
            margin-top: 60px;
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
            
            .hero-banner {
                margin-top: 140px;
                padding: 60px 0;
            }
            
            .hero-content h2 {
                font-size: 2.2rem;
            }
            
            .about-section {
                grid-template-columns: 1fr;
                padding: 50px 0;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-form button {
                padding: 15px;
            }
        }
        
        @media (max-width: 480px) {
            .hero-content h2 {
                font-size: 1.8rem;
            }
            
            .about-content h2 {
                font-size: 2rem;
            }
            
            .newsletter h2 {
                font-size: 1.8rem;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Cabeçalho -->
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
        </div>
    </header>

    <!-- Banner principal -->
    <section class="hero-banner">
        <div class="container hero-content">
            <h2>Um pouco sobre seus criadores</h2>
            <p>Uma breve jornada ao mundo de venda de jogos digitais no vale do paraíba</p>
        </div>
    </section>

    <!-- Seção sobre -->
    <div class="container">
        <section class="about-section">
            <div class="about-image">
                <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Equipe PlayOn">
            </div>
            
            <div class="about-content">
                <h2>Nossa História</h2>
                <p>Nossa história começou a partir de um projeto proposto pelo Prof. Me. Warner Brezolin (também criador da produtora de filmes Warner Brezos) e a influência da disciplina do Prof. Me. Carlos Feichas. A inspiração foi levar jogos digitais mais acessíveis para o público do Vale do Paraíba.</p>
                <p>Conheça nossos criadores:</p>
                <ul class="team-list">
                    <li>Daniel Marton - Engenheiro de Software</li>
                    <li>Breno Fernandes - Backend Sênior</li>
                    <li>Mariana Freita - Frontend Sênior</li>
                    <li>João Vitor Ferreira - Engenheiro de Dados</li>
                </ul>
            </div>
        </section>
    </div>

    <!-- Newsletter -->
    <div class="container">
        <section class="newsletter">
            <h2>Fique por dentro das novidades</h2>
            <p>Cadastre-se para receber promoções exclusivas e novidades em primeira mão</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Seu melhor e-mail" required>
                <button type="submit">Inscrever</button>
            </form>
        </section>
    </div>

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
                    <h3>Categorias</h3>
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
            if (email) {
                alert('Obrigado por se inscrever! Você receberá nossas novidades em breve.');
                this.reset();
            }
        });
    </script>
</body>
</html>