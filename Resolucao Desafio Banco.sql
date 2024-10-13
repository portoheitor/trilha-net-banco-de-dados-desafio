--Filmes
---Tabela responsável por armazenar informações dos filmes.
--Nome / Ano / Duracao
--SELECT * FROM DBO.Filmes


--Atores
---Tabela responsável por armazenar informações dos atores.
-- PrimeiroNome / UltimoNome / Genero
--SELECT * FROM DBO.Atores


--Generos
--Tabela responsável por armazenar os gêneros dos filmes.
-- Genero
--SELECT * FROM DBO.Generos


--ElencoFilme
-----Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e atores,
--	 ou seja, um ator pode trabalhar em muitos filmes, e filmes podem ter muitos atores.
--SELECT * FROM DBO.ElencoFilme


--FilmesGenero
-----Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e gêneros,
--   ou seja, um filme pode ter mais de um gênero, e um genêro pode fazer parte de muitos filmes.
--SELECT * FROM DBO.FilmesGenero

-- DESAFIO COMEÇA AQUI ->

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

-- 3-> Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro'

-- 4-> Buscar os filmes lançados em 1997
SELECT 
	Nome,
	Ano,
	Duracao 
FROM Filmes
WHERE Ano = 1997

-- 5-> Buscar os filmes lançados APÓS o ano 2000
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

--7 -> Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

--SELECT * FROM Filmes ORDER BY Duracao DESC

SELECT
	Ano,
	COUNT(Nome)Quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY Quantidade DESC


-- 8-> Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT 
	*
FROM dbo.Atores
WHERE Genero = 'M'

-- 9-> Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT 
	*
FROM dbo.Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-- 10-> Buscar o nome do filme e o gênero
SELECT
    Filmes.Nome,
    Generos.Genero 
FROM Filmes
    INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
    INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id


-- 11-> Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
	Filmes.Nome,
	Generos.Genero
FROM Filmes
	INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
	INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE Genero = 'Mistério'


-- 12-> Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
    Filmes.Nome,
    Atores.PrimeiroNome,
    Atores.UltimoNome,
    ElencoFilme.Papel
FROM Filmes
    INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme 
    INNER JOIN Atores ON ElencoFilme.IdAtor = Atores.Id			










