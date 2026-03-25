--Criação tabelas modelo físico:
create table autor(
id_autor serial primary key,
nome varchar(50) not null
);

create table livro(
id_livro serial primary key,
titulo varchar(50) not null,
id_autor int,
foreign key (id_autor) references autor (id_autor)
on update no action on delete cascade
);

create table usuario(
id_usuario int primary key,
nome varchar(50) not null,
email varchar(50) unique not null 
);

create table emprestimo(
id_emprestimo int primary key,
data_emprestimo date,
data_devolucao date,
valor_emprestimo numeric,
id_usuario int,
foreign key (id_usuario) references usuario (id_usuario),
id_livro int,
foreign key (id_livro) references livro (id_livro) on delete no action
);

-- Popular tabelas:
insert into autor (nome) values
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado'),
('Carlos Drummond de Andrade'),
('Monteiro Lobato');

insert into livro (titulo, id_autor) values
('Dom Casmurro', 1),
('Memórias Póstumas de Brás Cubas', 1),
('A Hora da Estrela', 2),
('Perto do Coração Selvagem', 2),
('Capitães da Areia', 3),
('Sentimento do Mundo', 4),
('Sítio do Picapau Amarelo', 5),
('A Rosa do Povo', 4),
('Agua Viva', 2);

insert into usuario (id_usuario, nome, email) values
(1,'vitor','vitor@gmail.com'),
(2,'diana', 'diana@gmail.com'),
(3,'luiza','luiza@gmail.com'),
(4,'gabriela','gabriela@gmail.com'),
(5,'ana', 'ana@gmail.com'),
(6,'esther', 'esther@gmail.com');

insert into emprestimo ( id_emprestimo,data_emprestimo,data_devolucao,
valor_emprestimo, id_usuario,id_livro) values 
(1, '2026-03-01', '2026-03-10', 5.00, 1, 1),
(2, '2026-03-02', '2026-03-11', 6.50, 2, 9),
(3, '2026-03-03', '2026-03-12', 4.00, 3, 2),
(4, '2026-03-04', '2026-03-13', 7.00, 4, 5),
(5, '2026-03-05', '2026-03-14', 5.50, 5, 4),
(6, '2026-03-06', '2026-03-15', 6.00, 1, 8),
(7, '2026-03-07', '2026-03-16', 4.50, 2, 6);

-- 1) Retornar os livros emprestados.
select e.id_emprestimo, l.titulo, e.data_emprestimo from livro l
inner join emprestimo e on l.id_livro = e.id_livro

-- 2) Retornar os livros que não foram emprestados.
select l.titulo from livro l 
left join emprestimo e on l.id_livro = e.id_livro where e.id_livro is null

-- 3) Contar quantos livros foram emprestados.
select count (*) as qtd_livros_emprestados from emprestimo;

-- 4) A quantidade de livros que cada autor tem.
select a.nome, count (l.id_livro) from livro l
left join autor a on a.id_autor = l.id_autor 
group by a.nome;

-- 5) Exibir os livros do mais caro ao mais barato em ordem.
select l.titulo, e.valor_emprestimo from livro l
inner join emprestimo e on l.id_livro = e.id_livro order by e.valor_emprestimo desc;

-- 6) Apagar um autor consequentemente seu livro deverá ser automaticamente apagado.
delete from autor where id_autor = 3;

-- 7) Mostra o total arrecado em empréstimo de um determinado livro
select l.titulo, sum (e.valor_emprestimo) from livro l
inner join emprestimo e  on e.id_livro = l.id_livro
group by l.titulo;