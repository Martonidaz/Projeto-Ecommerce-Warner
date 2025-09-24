<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TelaInicio.aspx.cs" Inherits="TelaInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PlayOn - Sua Loja de Jogos</title>
    <link rel="stylesheet" href="../scr/site/style.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
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
                            <li><a href="Produtos.aspx">Produtos</a></li>
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
            <h2>Tecnologia de Ponta a Preços Acessíveis</h2>
            <p>Encontre os melhores jogos com garantia e entrega rápida</p>
            <a href="#" class="btn">Ver Ofertas</a>
        </div>
    </section>

    <!-- Categorias -->
    <section class="categories">
        <div class="container">
            <h2 class="section-title">Categoria de Jogos</h2>
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
                        <div>Dead By Daylight</div>
                    </div>
                    <div class="product-info">
                        <h3>Dead by Daylight é um jogo multijogador de ação e sobrevivência onde um Assassino caça quatro Sobreviventes em um mundo aterrorizante num jogo mortal de gato e rato</h3>
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
                        <div>Call Of Duty Modern Warfare 2</div>
                    </div>
                    <div class="product-info">
                        <h3>O Call of Duty®: Modern Warfare® II coloca os jogadores dentro de um
                            conflito global sem precedentes que conta com o retorno dos Operadores icônicos da Força-Tarefa 141.
                            De pequenas infiltrações táticas até missões altamente confidenciais, jogadores vão mobilizar junto de amigos em uma experiência verdadeiramente imersiva.
                            O Modern Warfare® II inclui uma campanha global para um jogador, combate Multijogador imersivo e uma experiência de Operações Especiais cooperativa com narrativa.</h3>
                        <p class="product-price">R$  319,00</p>
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
                        <div>Need For Speed Payback</div>
                    </div>
                    <div class="product-info">
                        <h3>Need for Speed™, uma das franquias de jogos mais vendidas do mundo, retorna com sede de revanche no novo sucesso de ação sobre quatro rodas, Need for Speed Payback."</h3>
                        <p class="product-price">R$ 7,790</p>
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
                        <div>The Elder Scrolls Online</div>
                    </div>
                    <div class="product-info">
                        <h3>Toda lenda começa em algum lugar e, em The Elder Scrolls Online, ela começa com você. Junte-se a milhões de jogadores em um RPG online de fantasia ambientado em um mundo vasto e dinâmico de Elder Scrolls.</h3>
                        <p class="product-price">R$ 61,50</p>
                        <p class="product-description">Requisitos Mínimos
                        Sistema Operacional: Windows® 10 64 bits
                        Processador: Intel® Core™ i5 2300 ou AMD® FX4350
                        Memória: 4 GB de RAM
                        Placa de vídeo: Placa de vídeo compatível com DirectX 11.0 e 1GB de RAM (NVIDIA® GeForce® 560 ou AMD® Radeon™ 6870)
                        DirectX: Versão 11
                        Rede: Conexão de internet banda larga
                        Armazenamento: 150 GB de espaço disponíve</p>
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
                    <h3>Blast Byte Boutique</h3>
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
                        <li><a href="#">Notebooks</a></li>
                        <li><a href="#">Computadores</a></li>
                        <li><a href="#">Periféricos</a></li>
                        <li><a href="#">Acessórios</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Contato</h3>
                    <ul>
                        <li>Email: contato@blastbyte.com</li>
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
                <p>&copy; 2023 Blast Byte Boutique - Todos os direitos reservados</p>
            </div>
        </div>
    </footer>

</body>
</html>
