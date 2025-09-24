<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dead By Daylight - PlayOn</title>
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
        
        /* Conteúdo principal */
        .game-detail {
            margin-top: 100px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            margin-bottom: 60px;
        }
        
        .game-image {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        
        .game-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        .game-info {
            padding: 20px 0;
        }
        
        .game-title {
            font-size: 2.5rem;
            margin-bottom: 10px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .game-price {
            font-size: 2rem;
            font-weight: 700;
            color: #6a11cb;
            margin-bottom: 20px;
        }
        
        .game-description {
            color: #b8b8d0;
            margin-bottom: 30px;
            line-height: 1.8;
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
            text-align: center;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        .btn-large {
            padding: 18px 40px;
            font-size: 1.2rem;
            width: 100%;
            margin-bottom: 15px;
        }
        
        .btn-secondary {
            background: transparent;
            border: 2px solid #6a11cb;
            color: #6a11cb;
        }
        
        .btn-secondary:hover {
            background: rgba(106, 17, 203, 0.1);
        }
        
        /* Seções de detalhes */
        .game-details {
            margin-bottom: 60px;
        }
        
        .section-title {
            font-size: 2rem;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .genres {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .genre-tag {
            background: rgba(106, 17, 203, 0.2);
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            border: 1px solid #6a11cb;
        }
        
        .requirements {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            padding: 30px;
            border: 1px solid #3a3a52;
        }
        
        .requirements h3 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #ffffff;
        }
        
        .requirements-list {
            list-style: none;
        }
        
        .requirements-list li {
            margin-bottom: 15px;
            padding-left: 20px;
            position: relative;
            color: #b8b8d0;
        }
        
        .requirements-list li::before {
            content: '•';
            color: #6a11cb;
            position: absolute;
            left: 0;
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
            
            .game-detail {
                grid-template-columns: 1fr;
                margin-top: 120px;
            }
            
            .game-title {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
        }
        
        @media (max-width: 480px) {
            .game-title {
                font-size: 1.8rem;
            }
            
            .section-title {
                font-size: 1.5rem;
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
                <div class="logo-img">🎮</div>
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
    <div class="container">
        <section class="game-detail">
            <div class="game-image">
                <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Dead By Daylight">
            </div>
            
            <div class="game-info">
                <h1 class="game-title">DEAD BY DAYLIGHT</h1>
                <div class="game-price">R$ 19,99</div>
                <p class="game-description">
                    Dead by Daylight é um jogo de horror de sobrevivência multijogador (4vs1) 
                    em que um jogador assume o papel de um Assassino selvagem e os outros quatro 
                    jogadores são os Sobreviventes tentando escapar dele para evitar serem capturados, 
                    torturados e mortos.
                </p>
                
                <div class="action-buttons">
                    <a href="#" class="btn btn-large">Comprar Agora</a>
                    <a href="#" class="btn btn-secondary btn-large">Adicionar à Lista de Desejos</a>
                </div>
                
                <div class="game-features">
                    <h3 class="section-title">Características Principais</h3>
                    <ul class="requirements-list">
                        <li>Jogo multijogador assimétrico (4vs1)</li>
                        <li>Diversos assassinos e sobreviventes para escolher</li>
                        <li>Atualizações regulares com novo conteúdo</li>
                        <li>Modo competitivo com ranking</li>
                        <li>Eventos sazonais especiais</li>
                    </ul>
                </div>
            </div>
        </section>
        
        <section class="game-details">
            <h2 class="section-title">Gêneros de Jogos</h2>
            <div class="genres">
                <span class="genre-tag">Terror</span>
                <span class="genre-tag">Sobrevivência</span>
                <span class="genre-tag">Suspense</span>
                <span class="genre-tag">Horror</span>
                <span class="genre-tag">Assustador</span>
                <span class="genre-tag">Sobrenatural</span>
                <span class="genre-tag">Tensão</span>
                <span class="genre-tag">Zumbi</span>
            </div>
            
            <h2 class="section-title">Requisitos do Sistema</h2>
            <div class="requirements">
                <h3>Requisitos Mínimos</h3>
                <ul class="requirements-list">
                    <li><strong>Sistema Operacional:</strong> Windows® 10/11 64 bits</li>
                    <li><strong>Processador:</strong> Intel® Core™ i3-4170 ou equivalente</li>
                    <li><strong>Memória:</strong> 8 GB de RAM</li>
                    <li><strong>Placa de vídeo:</strong> Placa gráfica compatível com DirectX 11, como a GeForce® GTX 460 1GB ou superior</li>
                    <li><strong>DirectX:</strong> Versão 11</li>
                    <li><strong>Armazenamento:</strong> 50 GB de espaço disponível</li>
                </ul>
            </div>
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
        window.addEventListener('scroll', function () {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.style.background = 'rgba(15, 15, 27, 0.98)';
            } else {
                header.style.background = 'rgba(15, 15, 27, 0.95)';
            }
        });

        // Simulação de adição ao carrinho
        document.querySelector('.btn-large').addEventListener('click', function (e) {
            e.preventDefault();
            alert('Dead By Daylight foi adicionado ao seu carrinho!');
        });
    </script>
</body>
</html>