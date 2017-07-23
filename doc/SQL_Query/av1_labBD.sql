create database apuracao
go
use apuracao

--escola alimentada
create table escola(
id_escola int not null,
nome_escola varchar(25) not null,
nota_final decimal(4,1),
nota_parcial decimal(4,1)
primary key(id_escola))

--quesito alimentado
create table quesito(
id_quesito int not null,
nome_quesito varchar(28) not null
primary key(id_quesito))

--jurado alimentado
create table jurado(
id_jurado int not null,
nome_jurado varchar(50) not null
primary key(id_jurado))

--quesitoJurado alimentado
create table quesitoJurado(
id_quesito int not null,
id_jurado int not null,
pos_jurado int not null
foreign key(id_quesito) references quesito(id_quesito),
foreign key(id_jurado) references jurado(id_jurado))

create table comissaoFrente(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table evolucao(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table fantasia(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table bateria(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table alegoria(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table harmonia(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table sambaEnredo(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table mestreSala(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

create table enredo(
id_escola int not null,
nota1 decimal(4,1),
nota2 decimal(4,1),
nota3 decimal(4,1),
nota4 decimal(4,1),
nota5 decimal(4,1),
maior decimal(4,1),
menor decimal(4,1),
total decimal(4,1)
foreign key(id_escola) references escola(id_escola))

insert into escola values
(0, 'Acadêmicos do Tatuapé', 0),
(1, 'Rosas de Ouro', 0),
(2, 'Mancha Verde', 0),
(3, 'Vai-Vai', 0),
(4, 'X-9 Paulistana', 0),
(5, 'Dragões da Real', 0),
(6, 'Águia de Ouro', 0),
(7, 'Nenê de Vila Matilde', 0),
(8, 'Gaviões da Fiel', 0),
(9, 'Mocidade Alegre', 0),
(10, 'Tom Maior', 0),
(11, 'Unidos de Vila Maria', 0),
(12, 'Acadêmicos do Tucuruvi', 0),
(13, 'Império de Casa Verde', 0)

insert into quesito values
(0, 'Comissao de Frente'),
(1, 'Evolução'),
(2, 'Fantasia'),
(3, 'Bateria'),
(4, 'Alegoria'),
(5, 'Harmonia'),
(6, 'Samba-Enredo'),
(7, 'Mestre-Sala e Porta-Bandeira'),
(8, 'Enredo')

insert into jurado values
(0, 'Mônica Barbosa'),
(1, 'João Vlamir'),
(2, 'Marcus Nery Magalhães'),
(3, 'Paulo César Morato'),
(4, 'Rafael David'),
(5, 'Rebeka Kaiser'),
(6, 'João Niemeyer'),
(7, 'Madson Oliveira'),
(8, 'Walber Ângelo de Freitas'),
(9, 'Alfredo Del Penho'),
(10, 'Clayton Fábio Oliveira'),
(11, 'Eri Galvão'),
(12, 'Mauro Costa Junior'),
(13, 'Célia Souto'),
(14, 'Mirian Orofino Gomes'),
(15, 'Jardel Maia Rodrigues'),
(16, 'Humberto Farjado da Silva'),
(17, 'Edileuza Batista de Aleluia'),
(18, 'Paola Novaes'),
(19, 'Salete Lisboa'),
(20, 'Marisa Maline'),
(21, 'Cláudio Luiz Matheus'),
(22, 'Fabiano Rocha'),
(23, 'Ary Jaime Cohen'),
(24, 'Sérgio Naidim'),
(25, 'Helenice Gomes'),
(26, 'Paulo Paradela'),
(27, 'Regina Oliva'),
(28, 'Desirée Bastos'),
(29, 'Beatriz Badejo'),
(30, 'Artur Nunes Gomes'),
(31, 'Johnny Soares'),
(32, 'Marcelo Figueira'),
(33, 'Pérsio Gomyde Brasil'),
(34, 'Fernanda Ollmo Silveira'),
(35, 'José Roberto Lages'),
(36, 'Sonia Gallo'),
(37, 'Ricardo Ottoboni'),
(38, 'Chicô Gouveia'),
(39, 'Leandro Osiris'),
(40, 'Zande Figueiredo'),
(41, 'Aurea Harmmerli'),
(42, 'Luiz Carlos Correa'),
(43, 'André Luís da Silva Junior'),
(44, 'Lúcia Simas')

insert into quesitoJurado values
(0, 0, 1),
(0, 1, 2),
(0, 2, 3),
(0, 3, 4),
(0, 4, 5),
(1, 5, 1),
(1, 6, 2),
(1, 7, 3),
(1, 8, 4),
(1, 9, 5),
(2, 10, 1),
(2, 11, 2),
(2, 12, 3),
(2, 13, 4),
(2, 14, 5),
(3, 15, 1),
(3, 16, 2),
(3, 17, 3),
(3, 18, 4),
(3, 19, 5),
(4, 20, 1),
(4, 21, 2),
(4, 22, 3),
(4, 23, 4),
(4, 24, 5),
(5, 25, 1),
(5, 26, 2),
(5, 27, 3),
(5, 28, 4),
(5, 29, 5),
(6, 30, 1),
(6, 31, 2),
(6, 32, 3),
(6, 33, 4),
(6, 34, 5),
(7, 35, 1),
(7, 36, 2),
(7, 37, 3),
(7, 38, 4),
(7, 39, 5),
(8, 40, 1),
(8, 41, 2),
(8, 42, 3),
(8, 43, 4),
(8, 44, 5)