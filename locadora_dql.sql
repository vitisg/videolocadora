#PROJETO FISÍCO DQL
USE locadora_nete_felix;

#Selecionar todos os dados de uma tabela
SELECT * from produtos;

#Selecionar um subconjunto de atributos de uma tabela
SELECT titulo from produtos;

#Selecionar dados de uma tabela mediante uma condição
SELECT * from produtos where produtora = "HBO";

#realizar seleção de dados sem apresentar duplicadas
SELECT DISTINCT diretor from produtos;

#realizar consulta de seleção-projeção-junção
SELECT CLIENTE.Pnome_cliente, ALUGA.fk_produtos_id_produto
FROM CLIENTE, ALUGA 
WHERE CLIENTE.id_cliente LIKE '0%'
AND CLIENTE.id_cliente = ALUGA.fk_cliente_id_cliente;

#atribuir apelidos
SELECT tipo_transacao as transacao from nota_fiscal_transacao;

#aplicar união
SELECT Ccpf FROM cliente
UNION
SELECT Fcpf FROM funcionario;

#aplicar interseção
SELECT DISTINCT id_produto, titulo FROM produtos
INNER JOIN
aluga on aluga.fk_produtos_id_produto = produtos.id_produto;

#aplicar diferença
SELECT fk_produtos_id_produto from aluga
WHERE fk_produtos_id_produto not in 
(SELECT id_produto FROM produtos);

#aplicar produto cartesiano
SELECT * FROM nota_fiscal_transacao CROSS JOIN cliente;

#consultar valores de atributos que iniciem por algum termo
SELECT * from produtos where titulo LIKE 'c%';

#ordenar resultados de consultas de forma ascendente
SELECT * from produtos where valor_produto order by valor_produto asc;

#utilizar função de agregação
SELECT COUNT(*) as diretor from produtos;

#realizar agrupamento de resultado de consulta
SELECT * FROM produtos group by produtora;