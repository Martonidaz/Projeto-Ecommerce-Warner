<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_admin.master" AutoEventWireup="true" CodeFile="visualizar_usuario.aspx.cs" Inherits="visualizar_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Estilos específicos para a página de visualização de usuários */
        .admin-container {
            max-width: 1200px;
            margin: 100px auto 40px;
            padding: 0 20px;
        }
        
        .page-title {
            font-size: 2.5rem;
            margin-bottom: 30px;
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
        
        /* Estilização da GridView */
        #gridUsuarios {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            background: rgba(42, 42, 60, 0.6);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        
        #gridUsuarios th {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            border: none;
        }
        
        #gridUsuarios td {
            padding: 12px 15px;
            border-bottom: 1px solid #3a3a52;
            color: #b8b8d0;
            background: rgba(42, 42, 60, 0.6);
        }
        
        #gridUsuarios tr:nth-child(even) td {
            background: rgba(42, 42, 60, 0.8);
        }
        
        #gridUsuarios tr:hover td {
            background: rgba(106, 17, 203, 0.1);
        }
        
        /* Estilização dos botões */
        .btn-grid {
            display: inline-block;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            font-size: 0.9rem;
            margin-right: 5px;
        }
        
        .btn-edit {
            background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
            color: white;
        }
        
        .btn-delete {
            background: transparent;
            border: 1px solid #ff4757;
            color: #ff4757;
        }
        
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
        }
        
        .btn-delete:hover {
            background: rgba(255, 71, 87, 0.1);
        }
        
        /* Estilização dos campos de edição */
        .edit-textbox {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid #3a3a52;
            border-radius: 5px;
            padding: 8px;
            color: white;
            width: 100%;
        }
        
        .edit-textbox:focus {
            outline: none;
            border-color: #6a11cb;
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
            background: rgba(46, 204, 113, 0.2);
            border: 1px solid #2ecc71;
            color: #2ecc71;
        }
        
        .status-error {
            background: rgba(231, 76, 60, 0.2);
            border: 1px solid #e74c3c;
            color: #e74c3c;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .admin-container {
                margin-top: 120px;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            #gridUsuarios {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admin-container">
        <h2 class="page-title">Gerenciar Usuários</h2>
        
        <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="id_usuario"
            OnRowEditing="gridUsuarios_RowEditing"
            OnRowCancelingEdit="gridUsuarios_RowCancelingEdit"
            OnRowUpdating="gridUsuarios_RowUpdating"
            OnRowDeleting="gridUsuarios_RowDeleting"
            GridLines="None" CssClass="styled-grid">
            <Columns>
                <asp:BoundField DataField="id_usuario" HeaderText="ID" ReadOnly="true" ItemStyle-CssClass="id-column" />
                <asp:BoundField DataField="username" HeaderText="Usuário" />
                <asp:BoundField DataField="nome" HeaderText="Nome" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" />
                <asp:BoundField DataField="sexo" HeaderText="Gênero" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="telefone" HeaderText="Telefone" />
                <asp:BoundField DataField="tipousuario" HeaderText="Tipo de Usuário" /> 
                <asp:CommandField 
                    ShowEditButton="true" 
                    ShowDeleteButton="true" 
                    EditText="Editar" 
                    CancelText="Cancelar" 
                    UpdateText="Atualizar" 
                    DeleteText="Excluir"
                    ButtonType="Link"
                    ControlStyle-CssClass="btn-grid"
                    EditButtonStyle-CssClass="btn-edit"
                    DeleteButtonStyle-CssClass="btn-delete" />
            </Columns>
        </asp:GridView>
    </div>
    
    <script>
        // Adicionar classes CSS aos elementos da GridView após o carregamento
        document.addEventListener('DOMContentLoaded', function() {
            // Adicionar classes aos cabeçalhos
            const headers = document.querySelectorAll('#gridUsuarios th');
            headers.forEach(header => {
                header.classList.add('grid-header');
            });
            
            // Adicionar classes às células
            const cells = document.querySelectorAll('#gridUsuarios td');
            cells.forEach(cell => {
                cell.classList.add('grid-cell');
            });
            
            // Adicionar classes aos botões
            const editButtons = document.querySelectorAll('a[href*="Edit"]');
            editButtons.forEach(button => {
                button.classList.add('btn-grid', 'btn-edit');
            });
            
            const deleteButtons = document.querySelectorAll('a[href*="Delete"]');
            deleteButtons.forEach(button => {
                button.classList.add('btn-grid', 'btn-delete');
            });
            
            // Adicionar classes aos campos de texto em modo de edição
            const textboxes = document.querySelectorAll('#gridUsuarios input[type="text"]');
            textboxes.forEach(textbox => {
                textbox.classList.add('edit-textbox');
            });
        });
        
        // Confirmar exclusão
        document.addEventListener('click', function(e) {
            if (e.target && e.target.href && e.target.href.includes('Delete')) {
                if (!confirm('Tem certeza que deseja excluir este usuário?')) {
                    e.preventDefault();
                }
            }
        });
    </script>
</asp:Content>