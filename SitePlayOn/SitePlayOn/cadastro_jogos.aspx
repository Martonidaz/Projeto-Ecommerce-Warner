<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="cadastro_jogos.aspx.cs" Inherits="cadastro_jogos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        
        /* Estilos específicos para a página de cadastro */
        .cadastro-container {
            max-width: 800px;
            margin: 100px auto 40px;
            padding: 30px;
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            border: 1px solid #3a3a52;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        
        .cadastro-title {
            font-size: 2rem;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
            color: #ffffff;
        }
        
        .cadastro-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #b8b8d0;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            background: rgba(15, 15, 27, 0.8);
            border: 1px solid #3a3a52;
            border-radius: 5px;
            color: #ffffff;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #6a11cb;
            box-shadow: 0 0 0 2px rgba(106, 17, 203, 0.2);
        }
        
        .form-control::placeholder {
            color: #6a6a8a;
        }
        
        .form-select {
            width: 100%;
            padding: 12px 15px;
            background: rgba(15, 15, 27, 0.8);
            border: 1px solid #3a3a52;
            border-radius: 5px;
            color: #ffffff;
            font-size: 1rem;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%236a11cb' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 12px;
        }
        
        .btn-cadastrar {
            display: block;
            width: 100%;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 20px;
        }
        
        .btn-cadastrar:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        .validation-message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: 500;
        }
        
        .success {
            background: rgba(76, 175, 80, 0.2);
            color: #4CAF50;
            border: 1px solid #4CAF50;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
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
            
            .cadastro-container {
                margin: 120px 20px 40px;
                padding: 20px;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 480px) {
            .cadastro-title {
                font-size: 1.8rem;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="cadastro-container">
            <h2 class="cadastro-title">Cadastro de Jogos</h2>
            
            <div class="form-group">
                <label class="form-label" for="<%= txtnomeJogo.ClientID %>">Nome do Jogo</label>
                <asp:TextBox ID="txtnomeJogo" runat="server" CssClass="form-control" Placeholder="Digite o nome do jogo"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="<%= txtdescriçãoJogo.ClientID %>">Descrição</label>
                <asp:TextBox ID="txtdescriçãoJogo" runat="server" CssClass="form-control" Placeholder="Digite a descrição do jogo" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="<%= data_lancamento.ClientID %>">Data de Lançamento</label>
                    <asp:TextBox ID="data_lancamento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="<%= precoJogo.ClientID %>">Preço (R$)</label>
                    <asp:TextBox ID="precoJogo" runat="server" CssClass="form-control" Placeholder="0,00" TextMode="Number" step="0.01"></asp:TextBox>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="<%= txttamanhoJogo.ClientID %>">Tamanho (GB)</label>
                    <asp:TextBox ID="txttamanhoJogo" runat="server" CssClass="form-control" Placeholder="Ex: 15.5" TextMode="Number" step="0.1"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="<%= ddlClassificacao.ClientID %>">Classificação</label>
                    <asp:DropDownList ID="ddlClassificacao" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="<%= ddlDesenvolvedora.ClientID %>">Desenvolvedora</label>
                    <asp:DropDownList ID="ddlDesenvolvedora" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="<%= ddlPublicadora.ClientID %>">Publicadora</label>
                    <asp:DropDownList ID="ddlPublicadora" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="<%= ddlGenero.ClientID %>">Gênero</label>
                    <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="<%= ddlPlataforma.ClientID %>">Plataforma</label>
                    <asp:DropDownList ID="ddlPlataforma" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            
            <asp:Button ID="btnConfirmaJogo" runat="server" Text="Confirmar Cadastro" OnClick="btnConfirmaJogo_Click" CssClass="btn-cadastrar" />
            
            <asp:Label ID="lblValidaJogo" runat="server" Text="" CssClass="validation-message"></asp:Label>
        </div>
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
                        <li><a href="TelaInicio.aspx">Página Inicial</a></li>
                        <li><a href="Produtos.aspx">Jogos</a></li>
                        <li><a href="Categoria.aspx">Categorias</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Categorias</h3>
                    <ul>
                        <li><a href="#">Ação</a></li>
                        <li><a href="#">Aventura</a></li>
                        <li><a href="#">RPG</a></li>
                        <li><a href="#">Estratégia</a></li>
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
</asp:Content>