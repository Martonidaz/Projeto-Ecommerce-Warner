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

    <!-- Produtos em destaque -->
    <section class="featured-products">
        <div class="container">
            <h2 class="section-title">Jogos em Destaque</h2>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">
                        <div>Notebook Gamer</div>
                    </div>
                    <div class="product-info">
                        <h3>Notebook Gamer Avançado</h3>
                        <p class="product-price">R$ 4.599,00</p>
                        <p class="product-description">Intel i7, 16GB RAM, GTX 1660Ti, SSD 512GB</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>Teclado Mecânico</div>
                    </div>
                    <div class="product-info">
                        <h3>Teclado Mecânico RGB</h3>
                        <p class="product-price">R$ 399,00</p>
                        <p class="product-description">Switches Blue, iluminação RGB, ABNT2</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>Monitor 4K</div>
                    </div>
                    <div class="product-info">
                        <h3>Monitor UltraWide 34"</h3>
                        <p class="product-price">R$ 2.899,00</p>
                        <p class="product-description">Resolução 3440x1440, 144Hz, Curvo</p>
                        <a href="#" class="btn">Comprar</a>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <div>Headset Gamer</div>
                    </div>
                    <div class="product-info">
                        <h3>Headset 7.1 Surround</h3>
                        <p class="product-price">R$ 299,00</p>
                        <p class="product-description">Áudio surround, microfone retrátil, RGB</p>
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
