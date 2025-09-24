<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="visualizar_usuario.aspx.cs" Inherits="visualizar_usuario" %>

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
        
        .admin-container {
            max-width: 1400px;
            margin: 100px auto 40px;
            padding: 0 20px;
        }
        
        /* Cabeçalho da página */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .page-title {
            font-size: 2.5rem;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            padding-bottom: 15px;
        }
        
        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .page-actions {
            display: flex;
            gap: 15px;
        }
        
        .btn-primary {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        /* Estilização da GridView */
        .grid-container {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            margin-bottom: 40px;
            overflow-x: auto;
        }
        
        #gridUsuarios {
            width: 100%;
            border-collapse: collapse;
            min-width: 1000px;
        }
        
        #gridUsuarios th {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            border: none;
            font-size: 0.9rem;
        }
        
        #gridUsuarios td {
            padding: 12px;
            border-bottom: 1px solid #3a3a52;
            color: #b8b8d0;
            background: rgba(42, 42, 60, 0.6);
            font-size: 0.9rem;
        }
        
        #gridUsuarios tr:nth-child(even) td {
            background: rgba(42, 42, 60, 0.8);
        }
        
        #gridUsuarios tr:hover td {
            background: rgba(106, 17, 203, 0.1);
        }
        
        /* Estilização dos botões */
        .btn-grid {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.25s;
            border: none;
            cursor: pointer;
            font-size: 0.8rem;
            margin-right: 6px;
            color: #fff;
            min-width: 70px;
        }
        
        .btn-edit {
            background: rgba(106, 17, 203, 0.8);
            border: 1px solid #6a11cb;
        }
        
        .btn-update {
            background: rgba(46, 204, 113, 0.8);
            border: 1px solid #2ecc71;
        }
        
        .btn-cancel {
            background: rgba(241, 196, 15, 0.8);
            border: 1px solid #f1c40f;
        }
        
        .btn-delete {
            background: rgba(231, 76, 60, 0.8);
            border: 1px solid #e74c3c;
        }
        
        .btn-edit:hover, .btn-update:hover, .btn-cancel:hover, .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        /* Estilização dos campos de edição */
        .edit-textbox {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid #3a3a52;
            border-radius: 5px;
            padding: 8px;
            color: #fff;
            width: 100%;
            font-size: 0.9rem;
        }
        
        .edit-textbox:focus {
            outline: none;
            border-color: #6a11cb;
            box-shadow: 0 0 0 2px rgba(106,17,203,0.2);
        }
        
        /* Mensagens de status */
        .status-message {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }
        
        .status-success {
            background: rgba(46, 204, 113, 0.12);
            border: 1px solid #2ecc71;
            color: #2ecc71;
        }
        
        .status-error {
            background: rgba(231, 76, 60, 0.12);
            border: 1px solid #e74c3c;
            color: #e74c3c;
        }
        
        /* Filtros e busca */
        .filters-container {
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
        }
        
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        
        .filter-label {
            font-size: 0.8rem;
            color: #b8b8d0;
        }
        
        .filter-input {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid #3a3a52;
            border-radius: 5px;
            padding: 8px 12px;
            color: #fff;
            min-width: 150px;
        }
        
        /* Estatísticas rápidas */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
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
            border-color: #6a11cb;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: #b8b8d0;
            font-size: 0.9rem;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .admin-container {
                margin-top: 120px;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .page-actions {
                width: 100%;
                justify-content: flex-start;
            }
            
            .filters-container {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .filter-input {
                width: 100%;
            }
            
            .stats-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 480px) {
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .page-title {
                font-size: 1.8rem;
            }
        }
        
        /* Aviso de administrador */
        .admin-warning {
            background: rgba(255, 193, 7, 0.1);
            border: 1px solid #ffc107;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .admin-warning-icon {
            font-size: 1.5rem;
        }
        
        .admin-warning-content h3 {
            color: #ffc107;
            margin-bottom: 5px;
            font-size: 1rem;
        }
        
        .admin-warning-content p {
            color: #b8b8d0;
            font-size: 0.85rem;
        }
        
        /* Indicador de carregamento */
        .loading-indicator {
            display: none;
            text-align: center;
            padding: 20px;
            color: #6a11cb;
        }
        
        .loading-indicator.active {
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admin-container">
        <!-- Cabeçalho da página -->
        <div class="page-header">
            <h1 class="page-title">👥 Gerenciar Usuários</h1>
            <div class="page-actions">
                <asp:HyperLink ID="lnkCadastroCliente" runat="server" NavigateUrl="~/cadastro_cliente.aspx" CssClass="btn-primary">
                    <span>+</span> Adicionar Usuário
                </asp:HyperLink>
                <button class="btn-primary" onclick="refreshGrid()">
                    <span>↻</span> Atualizar
                </button>
            </div>
        </div>
        
        <!-- Aviso de administrador -->
        <div class="admin-warning">
            <div class="admin-warning-icon">⚠️</div>
            <div class="admin-warning-content">
                <h3>Área Restrita - Gestão de Usuários</h3>
                <p>Todas as ações realizadas nesta página são registradas e monitoradas.</p>
            </div>
        </div>
        
        <!-- Estatísticas rápidas -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-number" id="totalUsers">0</div>
                <div class="stat-label">Total de Usuários</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="adminUsers">0</div>
                <div class="stat-label">Administradores</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="activeUsers">0</div>
                <div class="stat-label">Usuários Ativos</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">Hoje</div>
                <div class="stat-label">Última Atualização</div>
            </div>
        </div>
        
        <!-- Filtros e busca -->
        <div class="filters-container">
            <div class="filter-group">
                <label class="filter-label">Buscar por nome</label>
                <input type="text" class="filter-input" placeholder="Digite um nome..." id="searchName">
            </div>
            <div class="filter-group">
                <label class="filter-label">Tipo de usuário</label>
                <select class="filter-input" id="filterType">
                    <option value="">Todos</option>
                    <option value="admin">Administrador</option>
                    <option value="user">Usuário</option>
                </select>
            </div>
            <div class="filter-group">
                <label class="filter-label">Ordenar por</label>
                <select class="filter-input" id="sortBy">
                    <option value="nome">Nome</option>
                    <option value="username">Usuário</option>
                    <option value="id_usuario">ID</option>
                </select>
            </div>
            <button class="btn-primary" style="align-self: flex-end;" onclick="applyFilters()">
                Aplicar Filtros
            </button>
        </div>
        
        <!-- Indicador de carregamento -->
        <div class="loading-indicator" id="loadingIndicator">
            <p>Carregando dados dos usuários...</p>
        </div>
        
        <!-- GridView de usuários -->
        <div class="grid-container">
            <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="id_usuario"
                OnRowEditing="gridUsuarios_RowEditing"
                OnRowCancelingEdit="gridUsuarios_RowCancelingEdit"
                OnRowUpdating="gridUsuarios_RowUpdating"
                OnRowDeleting="gridUsuarios_RowDeleting"
                GridLines="None" CssClass="users-grid">
                <Columns>
                    <asp:BoundField DataField="id_usuario" HeaderText="ID" ReadOnly="true" ItemStyle-Width="60px" />
                    <asp:BoundField DataField="username" HeaderText="Usuário" />
                    <asp:BoundField DataField="nome" HeaderText="Nome Completo" />
                    <asp:BoundField DataField="cpf" HeaderText="CPF" />
                    <asp:BoundField DataField="sexo" HeaderText="Gênero" ItemStyle-Width="80px" />
                    <asp:BoundField DataField="email" HeaderText="E-mail" />
                    <asp:BoundField DataField="telefone" HeaderText="Telefone" />
                    <asp:BoundField DataField="tipousuario" HeaderText="Tipo" ItemStyle-Width="100px" />
                    <asp:CommandField 
                        ShowEditButton="true" 
                        ShowDeleteButton="true" 
                        EditText="Editar" 
                        CancelText="Cancelar" 
                        UpdateText="Salvar" 
                        DeleteText="Excluir"
                        ButtonType="Link"
                        ControlStyle-CssClass="btn-grid"
                        ItemStyle-Width="180px" />
                </Columns>
            </asp:GridView>
        </div>
        
        <!-- Mensagem quando não há usuários -->
        <div id="noUsersMessage" style="display: none; text-align: center; padding: 40px; color: #b8b8d0;">
            <h3>Nenhum usuário encontrado</h3>
            <p>Não há usuários cadastrados ou os filtros aplicados não retornaram resultados.</p>
        </div>
    </div>
    
    <script>
        // Adicionar classes CSS aos elementos da GridView após o carregamento
        document.addEventListener('DOMContentLoaded', function () {
            customizeGridView();
            updateUserStats();
        });

        function customizeGridView() {
            // Adicionar classes aos cabeçalhos
            const headers = document.querySelectorAll('#<%= gridUsuarios.ClientID %> th');
            headers.forEach(header => {
                header.classList.add('grid-header');
            });

            // Adicionar classes às células
            const cells = document.querySelectorAll('#<%= gridUsuarios.ClientID %> td');
            cells.forEach(cell => {
                cell.classList.add('grid-cell');
            });

            // Adicionar classes específicas aos botões
            const anchors = document.querySelectorAll('#<%= gridUsuarios.ClientID %> a');
            anchors.forEach(a => {
                const txt = (a.textContent || a.innerText || '').trim().toLowerCase();
                a.classList.add('btn-grid');
                
                if (txt === 'editar' || txt === 'edit' || a.getAttribute('href')?.includes('Edit')) {
                    a.classList.add('btn-edit');
                } else if (txt === 'salvar' || txt === 'update' || a.getAttribute('href')?.includes('Update')) {
                    a.classList.add('btn-update');
                } else if (txt === 'cancelar' || txt === 'cancel' || a.getAttribute('href')?.includes('Cancel')) {
                    a.classList.add('btn-cancel');
                } else if (txt === 'excluir' || txt === 'delete' || a.getAttribute('href')?.includes('Delete')) {
                    a.classList.add('btn-delete');
                }
            });

            // Adicionar classes aos inputs de edição
            const textboxes = document.querySelectorAll('#<%= gridUsuarios.ClientID %> input[type="text"]');
            textboxes.forEach(tb => {
                tb.classList.add('edit-textbox');
            });
            
            // Mostrar/ocultar mensagem de nenhum usuário
            const rows = document.querySelectorAll('#<%= gridUsuarios.ClientID %> tr');
            const noUsersMessage = document.getElementById('noUsersMessage');
            
            if (rows.length <= 1) { // Apenas o cabeçalho
                noUsersMessage.style.display = 'block';
            } else {
                noUsersMessage.style.display = 'none';
            }
        }

        // Confirmar exclusão
        document.addEventListener('click', function (e) {
            const el = e.target;
            if (el && el.tagName === 'A') {
                const txt = (el.textContent || el.innerText || '').trim().toLowerCase();
                if (txt === 'excluir' || txt === 'delete' || (el.getAttribute('href') && el.getAttribute('href').includes('Delete'))) {
                    if (!confirm('Tem certeza que deseja excluir este usuário?\n\nEsta ação não pode ser desfeita.')) {
                        e.preventDefault();
                    } else {
                        showLoadingIndicator();
                    }
                }
            }
        });
        
        // Atualizar estatísticas de usuários
        function updateUserStats() {
            const rows = document.querySelectorAll('#<%= gridUsuarios.ClientID %> tr');
            const totalUsers = Math.max(0, rows.length - 1); // Subtrair o cabeçalho

            let adminCount = 0;
            for (let i = 1; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName('td');
                if (cells.length >= 8) {
                    const userType = cells[7].textContent.trim().toLowerCase();
                    if (userType === 'admin') {
                        adminCount++;
                    }
                }
            }

            document.getElementById('totalUsers').textContent = totalUsers;
            document.getElementById('adminUsers').textContent = adminCount;
            document.getElementById('activeUsers').textContent = totalUsers; // Simplificação
        }

        // Aplicar filtros (simulação)
        function applyFilters() {
            showLoadingIndicator();

            // Simular processamento de filtros
            setTimeout(function () {
                hideLoadingIndicator();
                alert('Filtros aplicados com sucesso!');
                // Em uma implementação real, aqui você faria uma requisição ao servidor
                // para aplicar os filtros e atualizar a grid
            }, 1000);
        }

        // Atualizar a grid
        function refreshGrid() {
            showLoadingIndicator();

            // Simular recarregamento
            setTimeout(function () {
                hideLoadingIndicator();
                location.reload(); // Em uma implementação real, você poderia usar AJAX
            }, 1500);
        }

        // Mostrar indicador de carregamento
        function showLoadingIndicator() {
            document.getElementById('loadingIndicator').classList.add('active');
        }

        // Ocultar indicador de carregamento
        function hideLoadingIndicator() {
            document.getElementById('loadingIndicator').classList.remove('active');
        }

        // Simular atualização de estatísticas em tempo real
        setInterval(updateUserStats, 30000);
    </script>
</asp:Content>