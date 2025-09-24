<%@ Page Title="Admin" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Home_admin.aspx.cs" Inherits="Home_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel Admin - PlayOn</title>
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
        
        /* Cabeçalho Admin */
        .admin-header {
            background: rgba(15, 15, 27, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid #2a2a3c;
            padding: 20px 0;
            margin-bottom: 40px;
        }
        
        .admin-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .admin-title {
            font-size: 2rem;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }
        
        .admin-status {
            background: rgba(106, 17, 203, 0.2);
            padding: 10px 20px;
            border-radius: 20px;
            border: 1px solid #6a11cb;
            font-size: 0.9rem;
        }
        
        /* Menu Admin */
        .menu-admin {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            padding: 20px 0;
        }
        
        .admin-btn {
            background: rgba(42, 42, 60, 0.6);
            border: 2px solid #3a3a52;
            color: #ffffff;
            padding: 25px 20px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            min-height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: 10px;
        }
        
        .admin-btn:hover {
            transform: translateY(-5px);
            border-color: #6a11cb;
            box-shadow: 0 10px 25px rgba(106, 17, 203, 0.3);
            background: rgba(106, 17, 203, 0.1);
        }
        
        .admin-btn-primary {
            border-color: #6a11cb;
            background: linear-gradient(135deg, rgba(106, 17, 203, 0.2), rgba(37, 117, 252, 0.2));
        }
        
        .admin-btn-danger {
            border-color: #dc3545;
            background: rgba(220, 53, 69, 0.1);
        }
        
        .admin-btn-danger:hover {
            box-shadow: 0 10px 25px rgba(220, 53, 69, 0.3);
        }
        
        .btn-icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .btn-description {
            font-size: 0.9rem;
            color: #b8b8d0;
            font-weight: normal;
        }
        
        /* Estatísticas */
        .admin-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }
        
        .stat-card {
            background: rgba(42, 42, 60, 0.6);
            border: 1px solid #3a3a52;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
        }
        
        .stat-label {
            color: #b8b8d0;
            font-size: 0.9rem;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .admin-header-content {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .menu-admin {
                grid-template-columns: 1fr;
            }
            
            .admin-stats {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 480px) {
            .admin-stats {
                grid-template-columns: 1fr;
            }
            
            .admin-title {
                font-size: 1.5rem;
            }
            
            .admin-btn {
                padding: 20px 15px;
                min-height: 100px;
            }
        }
        
        /* Aviso de administrador */
        .admin-warning {
            background: rgba(255, 193, 7, 0.1);
            border: 1px solid #ffc107;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            text-align: center;
        }
        
        .admin-warning h3 {
            color: #ffc107;
            margin-bottom: 10px;
        }
        
        .admin-warning p {
            color: #b8b8d0;
            font-size: 0.9rem;
        }
    </style>
</asp:Content>   

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admin-header">
        <div class="container admin-header-content">
            <h1 class="admin-title">🎮 Painel de Administração</h1>
            <div class="admin-status">Modo Administrador Ativo</div>
        </div>
    </div>
    
    <div class="container">
        <!-- Aviso de administrador -->
        <div class="admin-warning">
            <h3>⚠️ Área Restrita</h3>
            <p>Você está acessando o painel administrativo. Todas as ações são monitoradas.</p>
        </div>
        
        <!-- Estatísticas rápidas -->
        <div class="admin-stats">
            <div class="stat-card">
                <div class="stat-number">1.247</div>
                <div class="stat-label">Usuários Cadastrados</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">356</div>
                <div class="stat-label">Jogos no Catálogo</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">12</div>
                <div class="stat-label">Plataformas</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">89</div>
                <div class="stat-label">Pedidos Hoje</div>
            </div>
        </div>
        
        <!-- Menu de administração -->
        <div class="menu-admin">
            <!-- Gestão de Usuários -->
            <asp:Button ID="btnCadastroUsuario" runat="server" Text="👥 Cadastrar Usuário" 
                OnClick="btnCadastroUsuario_Click" CssClass="admin-btn admin-btn-primary" />
            
            <asp:Button ID="btnVisualizarUsuarios" runat="server" Text="📊 Visualizar Usuários" 
                OnClick="btnVisualizarUsuarios_Click" CssClass="admin-btn" />
            
            <!-- Gestão de Jogos -->
            <asp:Button ID="btnCadastrarJogo" runat="server" Text="🎮 Cadastrar Jogo" 
                OnClick="btnCadastrarJogo_Click" CssClass="admin-btn admin-btn-primary" />
            
            <asp:Button ID="btnVisualizarJogos" runat="server" Text="📋 Visualizar Jogos" 
                CssClass="admin-btn" />
            
            <!-- Gestão de Plataformas -->
            <asp:Button ID="btnCadastrarPlataformas" runat="server" Text="💻 Cadastrar Plataformas" 
                CssClass="admin-btn admin-btn-primary" />
            
            <asp:Button ID="btnVisualizarPlataformas" runat="server" Text="🖥️ Visualizar Plataformas" 
                CssClass="admin-btn" />
            
            <!-- Navegação -->
            <asp:Button ID="btnTelaCliente" runat="server" Text="👀 Tela Cliente" 
                OnClick="btnTelaCliente_Click" CssClass="admin-btn" />
            
            <!-- Sair -->
            <asp:Button ID="btnSairAdmin" runat="server" Text="🚪 Sair" 
                OnClick="btnSairAdmin_Click" CssClass="admin-btn admin-btn-danger" />
        </div>
        
        <!-- Descrições dos botões -->
        <div style="margin-top: 40px; text-align: center;">
            <p style="color: #b8b8d0; font-size: 0.9rem;">
                💡 <strong>Dica:</strong> Clique em qualquer botão para acessar a funcionalidade correspondente.
                Use com responsabilidade!
            </p>
        </div>
    </div>

    <script>
        // Efeitos interativos para os botões
        document.querySelectorAll('.admin-btn').forEach(button => {
            button.addEventListener('mouseenter', function () {
                this.style.transform = 'translateY(-5px)';
            });

            button.addEventListener('mouseleave', function () {
                this.style.transform = 'translateY(0)';
            });
        });

        // Confirmação para ações importantes
        document.getElementById('btnSairAdmin').addEventListener('click', function (e) {
            if (!confirm('Tem certeza que deseja sair do modo administrador?')) {
                e.preventDefault();
            }
        });

        // Simulação de estatísticas em tempo real
        function updateStats() {
            const stats = document.querySelectorAll('.stat-number');
            stats.forEach(stat => {
                const current = parseInt(stat.textContent);
                const variation = Math.floor(Math.random() * 10) - 2;
                if (variation !== 0) {
                    stat.textContent = current + variation;
                    stat.style.color = variation > 0 ? '#28a745' : '#dc3545';
                    setTimeout(() => {
                        stat.style.color = '';
                    }, 1000);
                }
            });
        }

        // Atualizar estatísticas a cada 30 segundos
        setInterval(updateStats, 30000);
    </script>
</asp:Content>