/*
DROP table Artista Cascade;
DROP table Gravadora Cascade;
DROP table Playlist Cascade;
DROP table Musica Cascade;
DROP table Musica_Artista Cascade;
DROP table Usuario Cascade;
DROP table Playlist_Musica Cascade;
*/


CREATE TABLE Artista
(
  cod_autor INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod_autor)
);

CREATE TABLE Gravadora
(
  nome VARCHAR(50) NOT NULL,
  id_gravadora INT NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_gravadora)
);

CREATE TABLE Musica
(
  cod_musica INT NOT NULL,
  titulo VARCHAR(50) NOT NULL,
  id_gravadora INT NOT NULL,
  PRIMARY KEY (cod_musica),
  FOREIGN KEY (id_gravadora) REFERENCES Gravadora(id_gravadora)
);

CREATE TABLE Usuario
(
  id_usuario INT NOT NULL,
  nome VARCHAR(50)  NOT NULL,  
  PRIMARY KEY (id_usuario)
  
);

CREATE TABLE Playlist
(
  id_playlist INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  id_usu INT NOT NULL,
  PRIMARY KEY (id_playlist),
  FOREIGN KEY (id_usu) REFERENCES Usuario(id_usuario)
);



CREATE TABLE Musica_Artista
(
  cod_musica INT NOT NULL,
  cod_artista INT NOT NULL,
  PRIMARY KEY (cod_musica, cod_artista),
  FOREIGN KEY (cod_musica) REFERENCES Musica(cod_musica),
  FOREIGN KEY (cod_artista) REFERENCES Artista(cod_autor)
);



CREATE TABLE Playlist_Musica
(
  id_playlist INT NOT NULL,
  cod_musica INT NOT NULL,
  PRIMARY KEY (id_playlist, cod_musica),
  FOREIGN KEY (id_playlist) REFERENCES Playlist(id_playlist),
  FOREIGN KEY (cod_musica) REFERENCES Musica(cod_musica)
);


--- povoando o banco 
INSERT INTO public.usuario(id_usuario, nome)
	VALUES (10, 'Ana'), (11,'Bruno');

	
INSERT INTO public.artista(
            cod_autor, nome)
    VALUES (10, 'Engenheiros do Hawai');

INSERT INTO public.artista(
            cod_autor, nome)
    VALUES (11, 'Coldplay');

 INSERT INTO public.artista(
            cod_autor, nome)
    VALUES (12, 'Marisa Monte');

INSERT INTO public.gravadora(
            nome, id_gravadora, endereco)
    VALUES ('Som Livre', 1, 'Av. Itinerante, 10'), ('Max Discos', 2, 'Rua Pedro I, 20');
    

INSERT INTO public.musica(
            cod_musica, id_gravadora, titulo)
    VALUES (10, 1, 'Infinita Highway'), (21, 2, 'The Scientist'), (22,2,'Vilarejo');
	
INSERT INTO public.musica_artista(
            cod_musica, cod_artista)
    VALUES (10, 10), (22,12), (21,11) ;

INSERT INTO public.playlist(
            id_playlist, id_usu, nome, descricao)
    VALUES 
    (1, 10, 'Variadas', 'Minhas preferidas'), 
    (2, 11, 'Nacionais', 'Músicas do Brasil');

INSERT INTO public.playlist_musica(
            id_playlist, cod_musica)
    VALUES (1,10), (1,21), (2,10),(2,22);

/*----------------------------------------------------------------------------------------*/

select * from Playlist;

insert into Artista(cod_autor,nome)
	values(100,'Zezo');
	
insert into Gravadora(id_gravadora,nome,endereco)
	values(3,'Som Livre','No Centro');
	
insert into Musica(cod_musica,id_gravadora,titulo)
	values (30,3,'Decida'),(31,3,'Meu vicio é você'),(32,3,'Espumas ao vento'),(33,3,'Evidências'),(34,3,'A vida tem dessas coisas'); 

insert into Playlist_Musica(id_playlist,cod_musica)
	values (1,30),(1,31),(1,32),(1,33),(1,34);


select Musica.titulo
from Musica
where cod_musica = 10; -- Somente Infinita Highway; Q3

select *
from Musica
where titulo = 'Infinita Highway'; -- OK; Q4

select Musica.titulo
from Musica; -- OK; Q5

select Musica.titulo, Gravadora.nome
from Musica, Gravadora
where Musica.id_gravadora = Gravadora.id_gravadora; -- OK; Q6

select Playlist.nome,Playlist.id_playlist,Playlist.descricao,Playlist.id_usu
from Usuario,Playlist
where Usuario.nome = 'Ana' and Playlist.id_usu = Usuario.id_usuario; -- OK; Q7

select *
from Musica
where Musica.titulo like 'A%'; -- OK; Q8

select *
from Musica
where Musica.titulo like '____A'; -- OK; Q9

select *
from Artista
where Artista.cod_autor between 3 and 10; -- OK; Q10

select distinct Musica.titulo, Gravadora.nome
from Musica, Gravadora, Playlist, Usuario
where Usuario.nome = 'Bruno' and Playlist.id_usu = Usuario.id_usuario and Musica.id_gravadora = Gravadora.id_gravadora; -- OK, Q11


select distinct Artista.nome
from Playlist, Usuario, Playlist_Musica, Musica, Musica_Artista, Artista
where Usuario.nome = 'Ana' and Playlist.id_usu = Usuario.id_usuario and Playlist_Musica.id_playlist = Playlist.id_playlist and 
Playlist_Musica.cod_musica = Musica.cod_musica and Musica_Artista.cod_musica = Musica.cod_musica and Musica_Artista.cod_artista = Artista.cod_autor;



/*----------------------------------------------------------------------------------------*/

