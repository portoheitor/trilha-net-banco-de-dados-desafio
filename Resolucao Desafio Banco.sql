--Filmes
---Tabela respons�vel por armazenar informa��es dos filmes.
--Nome / Ano / Duracao
SELECT * FROM DBO.Filmes


--Atores
---Tabela respons�vel por armazenar informa��es dos atores.
-- PrimeiroNome / UltimoNome / Genero
SELECT * FROM DBO.Atores


--Generos
--Tabela respons�vel por armazenar os g�neros dos filmes.
-- Genero
SELECT * FROM DBO.Generos


--ElencoFilme
-----Tabela respons�vel por representar um relacionamento do tipo muitos para muitos entre filmes e atores,
--	 ou seja, um ator pode trabalhar em muitos filmes, e filmes podem ter muitos atores.
SELECT * FROM DBO.ElencoFilme


--FilmesGenero
-----Tabela respons�vel por representar um relacionamento do tipo muitos para muitos entre filmes e g�neros,
--   ou seja, um filme pode ter mais de um g�nero, e um gen�ro pode fazer parte de muitos filmes.
SELECT * FROM DBO.FilmesGenero

-- Desafio ->

-- 1-> Buscar o nome e ano dos filmes
SELECT 
	Nome,
	Ano
FROM Filmes

-- 2-> Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
ORDER BY Ano

-- 3-> Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o
SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro'

-- 4-> Buscar os filmes lan�ados em 1997
SELECT 
	Nome,
	Ano,
	Duracao 
FROM Filmes
WHERE Ano = 1997

-- 5-> Buscar os filmes lan�ados AP�S o ano 2000
SELECT
	Nome,
	Ano,
	Duracao 
FROM dbo.Filmes
WHERE Ano > 2000

-- 6-> Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT 
	Nome,
	Ano,
	Duracao
FROM dbo.Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao

--7 -> Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

--SELECT * FROM Filmes ORDER BY Duracao DESC

SELECT
	Ano,
	COUNT(Nome)Quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY Quantidade DESC


-- 8-> Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
SELECT 
	*
FROM dbo.Atores
WHERE Genero = 'M'

-- 9-> Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT 
	*
FROM dbo.Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-- 10-> Buscar o nome do filme e o g�nero
SELECT
    Filmes.Nome,
    Generos.Genero 
FROM Filmes
    INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
    INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id


-- 11-> Buscar o nome do filme e o g�nero do tipo "Mist�rio"
SELECT
	Filmes.Nome,
	Generos.Genero
FROM Filmes
	INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
	INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE Genero = 'Mist�rio'


-- 12-> Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
    Filmes.Nome,
    Atores.PrimeiroNome,
    Atores.UltimoNome,
    ElencoFilme.Papel
FROM Filmes
    INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme 
    INNER JOIN Atores ON ElencoFilme.IdAtor = Atores.Id			










