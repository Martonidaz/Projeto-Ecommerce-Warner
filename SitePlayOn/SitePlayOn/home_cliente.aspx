<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/MasterPage_Cliente.master" AutoEventWireup="true" CodeFile="Home_cliente.aspx.cs" Inherits="Inicio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Play On - Sua Loja de Jogos</title>
    <link rel="stylesheet" href="../scr/site/style.css" type="text/css">
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <div class="container header-content">
            <div class="logo">
                <img src="../scr/assets/playonlogo.png" class="logo-img">
                <h1>Play On</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="Home_cliente.aspx">Página Inicial</a></li>                    
                    <li><a href="Produtos.aspx">Produtos</a></li>
                    <li><a href="Categoria.aspx">Categoria</a></li>       
                    <li><a href="Cadastro_cliente.aspx">Cadastrar</a></li> 
                    <li><a> <asp:Button ID="btnLogout" OnClick="btnLogout_click" runat="server" Text="Sair" /> </a></li>                  
                    <li><a> <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Banner principal -->
    <section class="hero-banner">
        <div class="container hero-content">
            <h2>Tecnologia de Ponta a Preços Acessíveis</h2>
            <p>Encontre os melhores produtos de informática com garantia e entrega rápida</p>
            <a href="#" class="btn">Ver Ofertas</a>
        </div>
    </section>

    <section class="categories">
        <div class="container">
            <h2 class="section-title">Categoria de Jogos</h2>
            <div class="category-grid">
                <div class="category-card">
                    <div class="category-icon">💻</div>
                    <div class="category-info">
                        <h3>Notebooks</h3>
                        <p>Desempenho e mobilidade</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🖥️</div>
                    <div class="category-info">
                        <h3>Computadores</h3>
                        <p>Potência para trabalho e jogos</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">📱</div>
                    <div class="category-info">
                        <h3>Periféricos</h3>
                        <p>Teclados, mouses e acessórios</p>
                    </div>
                </div>
                <div class="category-card">
                    <div class="category-icon">🎮</div>
                    <div class="category-info">
                        <h3>Gaming</h3>
                        <p>Equipamentos para gamers</p>
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

</asp:Content>

