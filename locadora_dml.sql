#Projeto físico DML
use locadora_nete_felix;
start transaction;

#inserindo dados na tabela produtos
insert into produtos 
values ('4', '76', '22314', 'comendo galinha', 'hbo', 'herlon', '5'),
('9', '48', '22674', 'comendo BOI', 'NETEFELIX', 'RUAM', '7'),
('3', '76', '90314', 'comendo PEIXE', 'PRIME', 'BEATIZ', '9'),
('8', '23', '28314', 'comendo SALADA', 'SONIC', 'VANESSA', '8'),
('4', '78', '23414', 'DANÇANDO COM GALINHAS', 'hbo', 'herlon', '5'),
('7', '76', '27248', 'DERRUBANDO BOI', 'NETEFELIX', 'RUAM', '3'),
('3', '55', '25484', 'NADANDO COM PEIXES', 'PRIME', 'BEATIZ', '9'),
('0', '23', '02314', 'FAZENDO A SALADA', 'SONIC', 'VANESSA', '9');

#inserindo dados na tabela cliente
insert into cliente
values('Amanda', 'Maria', '99843', '71159182442', '12345432', 'Sao batista', '25', '81985462152'),
('Paulo', 'Silva', '87594', '82132495323', '94833743', '25 de outubro', '432', '81982842123'),
('Rodrigo', 'Santos', '03943', '34284323192', '23843824', '17 de junho', '51', '81985462633'),
('Valeria', 'Nunes', '00234', '43245885392', '14839254', '31 de marco', '110', '81970162153');

#inserindo dados na tabela funcionario
insert into funcionario
values ('Ana', '12485288643', '12345678906', '54891678', 'Silva'),
('Gabriel', '29536482318', '12345628906', '54845218', 'Oliveira'),
('Maria',  '49873616549', '14335678906', '45212678', 'Santos'),
('Marcos', '45821367925', '14345658906', '45612212', 'Silva'),
('Marilia', '79523461805', '45589462165', '97846513', 'Pereira');

#inserindo dados na tabela atendente
insert into atendente 
values ('12345678906', '3'),
('12345628906', '6');

#inserindo dados na tabela repositor
insert into repositor
values ('4', '45589462165');

#inserindo dados na tabela servicos_gerais
insert into servicos_gerais 
values ('76', '14335678906'),
('32', '14345658906');

#inserindo dados na tabela nota_fiscal transacao
insert into nota_fiscal_transacao
values('123456', 'aluga e venda', '2022-06-16', 'DÉBITO', '12345678906', '45', '99843'),
('122432', 'aluga e venda', '2022-04-02', 'PIX', '12345628906', '78', '87594'),
('439205', 'aluga e venda', '2022-05-01', 'PIX', '12345678906', '63', '03943'),
('318294', 'aluga e venda', '2022-07-12', 'CRÉDITO', '12345678906', '42', '00234');

#inserindo dados na tabela aluga
insert into aluga
values('123456', '23414', '99843', '2022-06-23', '20.50', '2022-06-16'),
('122432', '27248', '87594', '2022-04-24', '81.99', '2022-04-20'),
('439205', '25484', '03943', '2022-05-15', '100.00', '2022-05-01'),
('318294', '02314', '00234', '2022-07-19', '52.45', '2022-07-12');

#inserindo dados na tabela compra
insert into compra
values('123456', '22314', '99843', '40.00'),
('122432', '22674', '87594', '32.00'),
('439205', '90314', '03943', '40.00'),
('318294', '28314', '00234', '25.50');

#inserindo dados na tabela filme
insert into filme
values('92','22314'),
('121','22674'),
('115','90314'),
('108','28314');


#inserindo dados na tabela serie
insert into serie
values('14', '42', '23414'),
('12', '51', '27248'),
('9', '45', '25484'),
('21', '49', '02314');

#inserindo dados na tabela gerencia
insert into gerencia
values ('12345678906', '12345628906'),
('12345678906', '14335678906'),
('12345678906', '14345658906'),
('12345678906', '45589462165');

#inserindo dados na tabela reposicao
insert into reposicao
values ('02314'),
('25484');

COMMIT;