#projeto fisico DDl

#criando base de dados
CREATE DATABASE Locadora_nete_felix;
#SELECIONANDO A BASE DE DADOS PARA SER USADA
USE Locadora_nete_felix;

#CRIANDO A TABELA PRODUTOS
CREATE TABLE produtos (
    produtos_alugados INT not null,
    valor_produto INT not null,
    id_produto CHAR(5) PRIMARY KEY not null,
    titulo VARCHAR(30) not null,
    produtora VARCHAR(20),
    diretor VARCHAR(20),
    produtos_disponiveis INT not null
);

#CRIANDO A TABELA DE CLIENTES 
CREATE TABLE cliente (
    Pnome_cliente VARCHAR(20) NOT NULL,
    Unome_cliente VARCHAR(20) NOT NULL,
    id_cliente CHAR(5) PRIMARY KEY,
    Ccpf CHAR(11) NOT NULL,
    CEP CHAR(8),
    logradouro VARCHAR(20),
    numero INT,
    celular CHAR(11) not null
);

#CRIANDO A TABELA FILMES
CREATE TABLE filme (
    duracao INT,
    fk_produtos_id_produto CHAR(5) PRIMARY KEY,
    FOREIGN KEY (fk_produtos_id_produto) REFERENCES PRODUTOS(id_produto)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#CRIANDO A TABELA SERIE
CREATE TABLE serie (
    qtd_episodios INT not null,
    duracao_media_ep INT,
    fk_produtos_id_produto CHAR(5) PRIMARY KEY,
    FOREIGN KEY (fk_produtos_id_produto) REFERENCES PRODUTOS(id_produto)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#CRIANDO A TABELA FUNCIONARIO
CREATE TABLE funcionario (
    Pnome_fun VARCHAR(20) NOT NULL,
    celular CHAR(11) NOT NULL,
    Fcpf CHAR(11) PRIMARY KEY,
    CTPS INT NOT NULL,
    Unome_fun VARCHAR(15) NOT NULL
);

#CRIANDO A TABELA REPOSITOR
CREATE TABLE repositor (
    dias_trabalhados_rep INT not null,
    fk_funcionario_Fcpf CHAR(11) PRIMARY KEY,
    FOREIGN KEY (fk_funcionario_Fcpf) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#CRIANDO A TABELA DOS FUNCONARIOS DE SERVIÇOS GERAIS
CREATE TABLE servicos_gerais (
    horas_trabalhadas_serv INT NOT NULL,
    fk_funcionario_Fcpf CHAR(11) PRIMARY KEY,
    FOREIGN KEY (fk_funcionario_Fcpf) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#CRIANDO A TABELA PARA EMISSÃO DE NOTA FISCAL DE TRANSAÇÕES
CREATE TABLE nota_fiscal_transacao (
	id_transacao CHAR(7) PRIMARY KEY,
    tipo_transacao varchar(20),
    data_transacao DATE NOT NULL,
    tipo_pagamento VARCHAR(20),
    fk_funcionario_Fcpf CHAR(11) NOT NULL,
    valor_total INT NOT NULL,
    fk_cliente_id_cliente CHAR(5) NOT NULL,
    FOREIGN KEY (fk_funcionario_Fcpf) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_cliente_id_cliente) REFERENCES CLIENTE(id_cliente)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#CRIANDO TABELA PARA RELACIONAMENTO DE GERENCIA DE FUNCIONARIOS 
CREATE TABLE gerencia (
    fk_funcionario_Fcpf CHAR(11) NOT NULL,
    fk_funcionario_Fcpf_ CHAR(11) NOT NULL,
    FOREIGN KEY (fk_funcionario_Fcpf) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_funcionario_Fcpf_) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE
);
#CRIANDO A TABELA DE COMPRA DE PRODUTOS POR OS CLIENTES
CREATE TABLE compra (
	fk_nota_fiscal_transacao_id_transacao CHAR(7) NOT NULL,
    fk_produtos_id_produto CHAR(5) PRIMARY KEY NOT NULL,
    fk_cliente_id_cliente CHAR(5) NOT NULL,
    valor_produto INT NOT NULL,
    FOREIGN KEY (fk_produtos_id_produto) REFERENCES PRODUTOS(id_produto)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_cliente_id_cliente) REFERENCES CLIENTE(id_cliente)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_nota_fiscal_transacao_id_transacao) REFERENCES NOTA_FISCAL_TRANSACAO(id_transacao)
);
#CRIANDO A TABELA DE ALUGUEL DE PRODUTOS PARA CLIENTES
CREATE TABLE aluga(
	fk_nota_fiscal_transacao_id_transacao CHAR(7) NOT NULL,
    fk_produtos_id_produto CHAR(5) NOT NULL,
    fk_cliente_id_cliente CHAR(5) NOT NULL,
    data_entrega DATE NOT NULL,
    valor_multa INT,
    data_emprestimo DATE NOT NULL,
    FOREIGN KEY (fk_produtos_id_produto) REFERENCES PRODUTOS(id_produto)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_cliente_id_cliente) REFERENCES CLIENTE(id_cliente)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_nota_fiscal_transacao_id_transacao) REFERENCES NOTA_FISCAL_TRANSACAO(id_transacao)
);
#CRIANDO A TABELA DE REPOSIÇÃO DE PRODUTOS
CREATE TABLE reposicao (
    fk_produtos_id_produto CHAR(5) PRIMARY KEY,
    FOREIGN KEY (fk_produtos_id_produto) REFERENCES PRODUTOS(id_produto)
	ON DELETE CASCADE ON UPDATE CASCADE
);
#CRIANDO A TABELA DE FUNCIONARIOS DE ATENDIMENTO
CREATE TABLE atendente (
    fk_funcionario_Fcpf CHAR(11) PRIMARY KEY,
    dias_trabalhados_aten INT NOT NULL,
    FOREIGN KEY (fk_funcionario_Fcpf) REFERENCES FUNCIONARIO(Fcpf)
	ON DELETE CASCADE ON UPDATE CASCADE
);

#criar regra apenas para consultas do banco criado
CREATE ROLE regra_consulta;
GRANT SELECT ON locadora_nete_felix.* TO regra_consulta;

#criar regra para execução de comandos DML e DQL
CREATE role regra_dml_dql;
GRANT INSERT, UPDATE, DELETE, SELECT ON locadora_nete_felix.* TO regra_dml_dql;

#criar regra para execução de comandos DDL
CREATE ROLE if not exists regra_ddl;
GRANT CREATE, ALTER, DROP ON locadora_nete_felix.* TO regra_ddl;

#criar usuário que possua a regra padrão para consulta (criada anteriormente)
CREATE USER 'nicolas'@'localhost' IDENTIFIED BY '12345';
GRANT 'regra_consulta' TO 'nicolas'@'localhost';

#criar usuário que possua a regra padrão para comandos DML e DQL (criada anteriormente)
CREATE USER 'gabriel'@'localhost' IDENTIFIED BY '567890';
GRANT 'regra_dml_dql' TO 'gabriel'@'localhost';

#criar usuário que possua a regra padrão para comandos ddl (criada anteriormente)
CREATE USER 'vitoria'@'localhost' IDENTIFIED BY '12345';
GRANT 'regra_ddl' TO 'vitoria'@'localhost';

#criar view a partir de mais de uma tabela
CREATE VIEW ATENDENTE_TRANSACOES
	AS
	SELECT
		F.Pnome_fun as Prim_nome_funcionario,
        F.Unome_fun as Ult_nome_funcionario,
        N.id_transacao,
        N.valor_total,
        N.data_transacao
	FROM
		FUNCIONARIO F,
		NOTA_FISCAL_TRANSACAO N
	WHERE Fcpf = 12485288643;

#MOSTRANDO A VIEW
SELECT * FROM ATENDENTE_TRANSACOES;

#criar uma regra para consulta apenas na visualização criada
CREATE ROLE regra_view;
GRANT SELECT ON ATENDENTE_TRANSACOES.* TO regra_view;

#criar usuário que possua a regra padrão para consulta da view (criadas anteriormente)
CREATE USER 'JOAO'@'localhost' IDENTIFIED BY '7654321';
SET default role regra_view TO 'JOAO'@'localhost';
