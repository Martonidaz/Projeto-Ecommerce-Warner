<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro_cliente.aspx.cs" Inherits="Cadastro_cliente" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - PlayOn</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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
        .main-content {
            margin-top: 100px;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0;
        }
        
        .form-container {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            border: 1px solid #3a3a52;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        
        .form-title {
            font-size: 2.2rem;
            margin-bottom: 30px;
            text-align: center;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            padding-bottom: 15px;
        }
        
        .form-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
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
            padding: 15px;
            border: 1px solid #3a3a52;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #6a11cb;
            box-shadow: 0 0 0 2px rgba(106, 17, 203, 0.2);
        }
        
        .form-control::placeholder {
            color: #8a8aa8;
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
            width: 100%;
            margin-top: 10px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        .btn-secondary {
            background: transparent;
            border: 2px solid #6a11cb;
            color: #6a11cb;
        }
        
        .btn-secondary:hover {
            background: rgba(106, 17, 203, 0.1);
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        .form-message {
            padding: 10px;
            border-radius: 5px;
            margin-top: 15px;
            text-align: center;
            font-weight: 500;
        }
        
        .form-message.error {
            background: rgba(255, 0, 0, 0.1);
            border: 1px solid rgba(255, 0, 0, 0.3);
            color: #ff6b6b;
        }
        
        .form-message.success {
            background: rgba(0, 255, 0, 0.1);
            border: 1px solid rgba(0, 255, 0, 0.3);
            color: #6bff6b;
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
            
            .main-content {
                margin-top: 140px;
                padding: 20px 0;
            }
            
            .form-container {
                padding: 30px 20px;
            }
            
            .form-title {
                font-size: 1.8rem;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 480px) {
            .form-title {
                font-size: 1.6rem;
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

    <!-- Conteúdo principal -->
    <div class="main-content">
        <div class="container">
            <form id="form1" runat="server" class="form-container">
                <h2 class="form-title">Cadastro de Cliente</h2>
                
                <div class="form-group">
                    <label for="txtUser" class="form-label">Nome de Usuário</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" Placeholder="Nome de usuário"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtSenha" class="form-label">Senha</label>
                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" Placeholder="Senha" TextMode="Password"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtNome" class="form-label">Nome Completo</label>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" Placeholder="Seu Nome"></asp:TextBox>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtCPF" class="form-label">CPF</label>
                        <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control" Placeholder="CPF"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="listgen" class="form-label">Gênero</label>
                        <asp:DropDownList ID="listgen" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Selecione..." Value="" />
                            <asp:ListItem Text="Masculino" Value="M" />
                            <asp:ListItem Text="Feminino" Value="F" />
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtData" class="form-label">Data de Nascimento</label>
                        <asp:TextBox ID="txtData" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtTel" class="form-label">Telefone</label>
                        <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" Placeholder="Telefone" TextMode="Phone"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnConfirma" runat="server" Text="Confirmar Cadastro" OnClick="btnConfirma_Click" CssClass="btn" />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar ao Início" OnClick="btnVoltar_Click" CssClass="btn btn-secondary" />
                
                <asp:Label ID="lblCadastro" runat="server" Text="" CssClass="form-message"></asp:Label>
            </form>
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
        // Adicionar classe de destaque ao menu conforme a rolagem
        window.addEventListener('scroll', function() {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.style.background = 'rgba(15, 15, 27, 0.98)';
            } else {
                header.style.background = 'rgba(15, 15, 27, 0.95)';
            }
        });

        // Formatação automática do CPF
        document.getElementById('txtCPF').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 3 && value.length <= 6) {
                value = value.replace(/(\d{3})(\d+)/, '$1.$2');
            } else if (value.length > 6 && value.length <= 9) {
                value = value.replace(/(\d{3})(\d{3})(\d+)/, '$1.$2.$3');
            } else if (value.length > 9) {
                value = value.replace(/(\d{3})(\d{3})(\d{3})(\d+)/, '$1.$2.$3-$4');
            }
            e.target.value = value;
        });

        // Formatação automática do telefone
        document.getElementById('txtTel').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 2 && value.length <= 6) {
                value = value.replace(/(\d{2})(\d+)/, '($1) $2');
            } else if (value.length > 6 && value.length <= 10) {
                value = value.replace(/(\d{2})(\d{4})(\d+)/, '($1) $2-$3');
            } else if (value.length > 10) {
                value = value.replace(/(\d{2})(\d{5})(\d+)/, '($1) $2-$3');
            }
            e.target.value = value;
        });

        // Validação básica do formulário no front-end
        document.getElementById('form1').addEventListener('submit', function(e) {
            let isValid = true;
            const inputs = this.querySelectorAll('input[required], select[required]');
            
            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.style.borderColor = '#ff6b6b';
                } else {
                    input.style.borderColor = '#3a3a52';
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                alert('Por favor, preencha todos os campos obrigatórios.');
            }
        });
    </script>
</body>
</html>