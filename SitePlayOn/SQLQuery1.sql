SELECT u.id_usuario, u.username, c.nome, c.cpf, c.sexo, c.data_nascimento, c.telefone, c.email, c.data_cadastro, u.tipousuario FROM Usuario u INNER JOIN Cliente c On u.id_cliente = c.id_cliente

INSERT INTO Cliente (nome, cpf, sexo, data_nascimento, telefone, email, data_cadastro) VALUES ('BRENO', '12345678910', 'M', '2002-07-06', '12991883920','breno@ryan','2025-09-23')

INSERT INTO Usuario (username, senha,id_cliente, tipousuario) VALUES ('Breno', '123', 17, 'admin')
SELECT * FROM Cliente
SELECT * FROM Usuario


DROP TABLE 

DELETE FROM Cliente WHERE id_cliente = 16;
DELETE FROM Usuario WHERE id_usuario = 6;