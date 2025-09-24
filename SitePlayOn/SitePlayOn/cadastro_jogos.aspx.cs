using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastro_jogos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tipousuario"] == null || Session["tipousuario"].ToString() == "cliente")
        {
            Response.Redirect("Login.aspx");
        }
        DropId();
    }

    protected void btnConfirmaJogo_Click(object sender, EventArgs e)
    {
        

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            decimal preco = Convert.ToDecimal(precoJogo.Text);
            int idDesenvolvedor = Convert.ToInt32(ddlDesenvolvedora.SelectedValue);
            int idPublicadora = Convert.ToInt32(ddlPublicadora.SelectedValue);
            int idClassificacao = Convert.ToInt32(ddlClassificacao.SelectedValue);
            int idGenero = Convert.ToInt32(ddlGenero.SelectedValue);
            int idPlataforma = Convert.ToInt32(ddlPlataforma.SelectedValue);

            string sqlJogos = @"INSERT INTO Jogos (nome, descricao, data_lancamento, preco, tamanho, id_desenvolvedor, id_publicadora, id_classificacao) OUTPUT INSERTED.id_jogo VALUES (@nome, @descricao, @data_lancamento, @preco, @tamanho, @id_desenvolvedor, @id_publicadora, @id_classificacao, @id_genero, @id_plataforma)";

            SqlCommand cmdJogos = new SqlCommand(sqlJogos, con);

            cmdJogos.Parameters.AddWithValue("@nome", txtnomeJogo.Text);
            cmdJogos.Parameters.AddWithValue("@descricao", txtdescriçãoJogo.Text);
            cmdJogos.Parameters.AddWithValue("@data_lancamento", data_lancamento.Text);
            cmdJogos.Parameters.AddWithValue("@preco", preco);
            cmdJogos.Parameters.AddWithValue("@tamanho", txttamanhoJogo.Text);
            cmdJogos.Parameters.AddWithValue("@id_desenvolvedor", idDesenvolvedor);
            cmdJogos.Parameters.AddWithValue("@id_publicadora", idPublicadora);
            cmdJogos.Parameters.AddWithValue("@id_classificacao", idClassificacao);
            cmdJogos.Parameters.AddWithValue("@id_genero", idGenero);
            cmdJogos.Parameters.AddWithValue("@id_plataforma", idPlataforma);


            con.Open();
            cmdJogos.ExecuteNonQuery();
        }

        lblValidaJogo.Text = "Jogo cadastrado com sucesso!";
    }

    protected void DropId()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // Desenvolvedoras
            SqlCommand cmdDev = new SqlCommand("SELECT id_desenvolvedor, nome_desenvolvedor FROM Desenvolvedor", con);
            SqlDataReader drDev = cmdDev.ExecuteReader();
            ddlDesenvolvedora.DataSource = drDev;
            ddlDesenvolvedora.DataTextField = "nome_desenvolvedor";
            ddlDesenvolvedora.DataValueField = "id_desenvolvedor";
            ddlDesenvolvedora.DataBind();
            drDev.Close();

            // Publicadoras
            SqlCommand cmdPub = new SqlCommand("SELECT Id_publicadora, nome_publicadora FROM Publicadora", con);
            SqlDataReader drPub = cmdPub.ExecuteReader();
            ddlPublicadora.DataSource = drPub;
            ddlPublicadora.DataTextField = "nome_publicadora";
            ddlPublicadora.DataValueField = "id_publicadora";
            ddlPublicadora.DataBind();
            drPub.Close();

            // Classificações
            SqlCommand cmdClass = new SqlCommand("SELECT id_classificacao, descricao FROM Classificacao", con);
            SqlDataReader drClass = cmdClass.ExecuteReader();
            ddlClassificacao.DataSource = drClass;
            ddlClassificacao.DataTextField = "descricao";
            ddlClassificacao.DataValueField = "id_classificacao";
            ddlClassificacao.DataBind();
            drClass.Close();

            //Genero
            SqlCommand cmdGen = new SqlCommand("SELECT id_genero, nome_genero FROM Genero", con);
            SqlDataReader drGen = cmdGen.ExecuteReader();
            ddlGenero.DataSource = drGen;
            ddlGenero.DataTextField = "nome_genero";
            ddlGenero.DataValueField = "id_genero";
            ddlGenero.DataBind();
            drGen.Close();

            //Plataforma
            SqlCommand cmdPlat = new SqlCommand("SELECT id_plataforma, nome_plataforma FROM Plataforma", con);
            SqlDataReader drPlat = cmdPlat.ExecuteReader();
            ddlPlataforma.DataSource = drPlat;
            ddlPlataforma.DataTextField = "nome_plataforma";
            ddlPlataforma.DataValueField = "id_plataforma";
            ddlPlataforma.DataBind();
            drPlat.Close();
        }
    }
}
