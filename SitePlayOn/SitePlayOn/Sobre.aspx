<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sobre.aspx.cs" Inherits="TelaInicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sobre - PlayOn</title>
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
                            <li><a href="Produtos.aspx">Jogos</a></li>
                            <li><a href="Categoria.aspx">Sobre Nós</a></li>                          
                            <li><a href="Login.aspx">Login</a></li>
                        </ul>        
                    </nav>
                </div>
            </header>
    </form>

    <!-- Banner principal -->
    <section class="hero-banner">
        <div class="container hero-content">
            <h2>Nossa História</h2>
            <p>Uma breve jornada ao mundo de venda de jogos digitais no vale do paraíba</p>
        </div>
    </section>

    <!-- Mensagem -->
    <div class="product-card">
    <div class="product-image">
        <img src="scr/assets/image-sobre.png" />
    </div>
    <div class="product-info">
        <h3>Início</h3>
        <p class="product-description">Nossa história começou a partir de um projeto proposto pelo Prof. Me. Warner Brezolin
            (também criador da produtora de filmes Warner Brezos) e a influência da disciplina do Prof. Me. Carlos Feichas, com a inspiração de levar jogos digitais mais acessíveis para o público vale paraibano com seus criadores:</p>
        <br>Daniel Marton - Engenheiro de Software</br>    
        <br>Breno Fernandes - Backend Sênior</br>    
        <br>Mariana Freita - Frontend Sênior</br>    
        <br>João Vitor Ferreira - Engenheiro de Dados</br>    
        
    </div>
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

</body>
</html>
