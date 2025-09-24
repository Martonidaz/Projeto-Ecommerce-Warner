<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema - Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            padding: 40px 30px;
            position: relative;
            overflow: hidden;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h1 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: #666;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }
        
        .textbox {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .textbox:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
            outline: none;
        }
        
        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
        }
        
        .btn-primary {
            background-color: #667eea;
            color: white;
            margin-bottom: 15px;
        }
        
        .btn-primary:hover {
            background-color: #5a6fd8;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: #f8f9fa;
            color: #333;
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background-color: #e9ecef;
        }
        
        .validation-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            min-height: 20px;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            background-color: rgba(231, 76, 60, 0.1);
            display: none;
        }
        
        .validation-message.show {
            display: block;
        }
        
        .password-container {
            position: relative;
        }
        
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #777;
            cursor: pointer;
        }
        
        .footer-links {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
        
        .footer-links a {
            color: #667eea;
            text-decoration: none;
        }
        
        .footer-links a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
            
            .login-header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <h1>Bem-vindo</h1>
                <p>Faça login para acessar sua conta</p>
            </div>
            
            <div class="form-group">
                <label for="txtLogin">Usuário</label>
                <asp:TextBox ID="txtLogin" runat="server" CssClass="textbox" Placeholder="Digite seu usuário"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtSenha">Senha</label>
                <div class="password-container">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="textbox" Placeholder="Digite sua senha"></asp:TextBox>
                    <button type="button" class="toggle-password" id="togglePassword">👁️</button>
                </div>
            </div>
            
            <asp:Label ID="lblValida" runat="server" Text="" CssClass="validation-message"></asp:Label>
            
            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" OnClick="btnCadastro_Click" CssClass="btn btn-secondary" />
            
            <div class="footer-links">
                <a href="#">Esqueceu sua senha?</a>
            </div>
        </div>
    </form>
    
    <script>
        // Toggle para mostrar/ocultar senha
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordField = document.getElementById('<%= txtSenha.ClientID %>');
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.textContent = type === 'password' ? '👁️' : '🔒';
        });
        
        // Validação em tempo real
        document.getElementById('<%= txtLogin.ClientID %>').addEventListener('blur', function() {
            validateField(this, 'Login é obrigatório');
        });
        
        document.getElementById('<%= txtSenha.ClientID %>').addEventListener('blur', function() {
            validateField(this, 'Senha é obrigatória');
        });
        
        function validateField(field, message) {
            const validationLabel = document.getElementById('<%= lblValida.ClientID %>');
            if (field.value.trim() === '') {
                validationLabel.textContent = message;
                validationLabel.classList.add('show');
                field.style.borderColor = '#e74c3c';
            } else {
                validationLabel.classList.remove('show');
                field.style.borderColor = '#ddd';
            }
        }
        
        // Limpar mensagem de validação ao focar nos campos
        document.getElementById('<%= txtLogin.ClientID %>').addEventListener('focus', function() {
            document.getElementById('<%= lblValida.ClientID %>').classList.remove('show');
            this.style.borderColor = '#ddd';
        });
        
        document.getElementById('<%= txtSenha.ClientID %>').addEventListener('focus', function() {
            document.getElementById('<%= lblValida.ClientID %>').classList.remove('show');
            this.style.borderColor = '#ddd';
        });
    </script>
</body>
</html>