CREATE DATABASE siteAjwebconcept;

-- colocar un admin seguro que nadie pueda entrar en tu bade de datos
-- CREATE USER "adminaguila"@"localhost" ou otro
-- IDENTIFIED BY "blacKBull"; u otro
-- GRANT ALL PRIVILEGES ON SiteAjwebconcept
-- TO "adminaguila"@"localhost";

--PARA CAMBIAR EL INTERCLASSEMENT 
--ALTER TABLE enregistrer CONVERT TO CHARACTER SET utf8;

CREATE USER "adminaguila"@"localhost" IDENTIFIED BY "blackbull";
GRANT ALL PRIVILEGES ON SiteWebconcept.* TO "adminaguila"@"localhost";
FLUSH PRIVILEGES;

USE siteAjwebconcept;

-- Create a new table called 's'enregistrer'
CREATE TABLE Utilisateur
(
    id INT(100) AUTO_INCREMENT PRIMARY KEY, -- primary key column
	pseudo VARCHAR(250) NOT NULL,
	prenom VARCHAR (255) NOT NULL,
	titreJob VARCHAR (255) NOT NULL,
	email VARCHAR(255) NOT NULL,
    motPasse VARCHAR(255) NOT NULL,
	conformationMotPasse VARCHAR(255) NOT NULL,
  );

 --A REVISAR LA MANERA DE INTRODUCIR LAS REQUETTES
--création de la requête 1 SQL:
--$sql = "INSERT  INTO personnes (cat, pseudo, prenom, titrejob, email, motPasse. confirmationMotPasse)
--VALUES ( '$cat','$nom', '$prenom', '$email', '$motPasse','confirmationMotPasse' ) " ;
--création de la requête 2 SQL: a reviser
--$sql = "INSERT  INTO personnes ( `id`, `pseudo`, `prenom`,`titrejob`, `email`, `motPasse`, `confirmationMotPasse`)
--VALUES  (null, blackbull, Jose, Développeur, aj.webconcept@gmail.com, blackbull_2020, blackbull_2020)";
--Resumé
--création de la table login, une fois l'utilisateru il est engegistrer

-- Create a new table called 'login'
CREATE TABLE Connexion(
id INT NOT NULL,
idUtilisateur INT(100) NOT NULL, -- foreign key,
pseudo VARCHAR(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
email VARCHAR(255)COLLATE utf8mb4_unicode_520_ci NOT NULL,
motDePasse VARCHAR (255) COLLATE utf8mb4_unicode_520_ci,
PRIMARY KEY (id),
FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(id)
);

-- INSERT INTO `utilisateurLogin` (`id`, `nom`, `mail`, `motdepasse`) VALUES
-- (1, 'bello', 'bello@gmail.com', 'c3240b9898aede89ba5730b4b028355257d7f1d2'),--.SSH ET encriptado
-- (2, 'jose', 'aguilarodriguezjose@gmail.com', 'fb5d99d8ffe111fc8b768a1bda9ccb3ed9627156'),
-- (3, 'bertrand', 'bertrand@gmail.com', '7647b3f0de2c5f049f3fd8683da596016764b513'),
-- (4, 'chokrim', 'chokrim@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
-- (5, 'sandra', 'sandra@gmail.com', 'cad1524360e58851cd0ae1e82b75ff5283474667'),
-- (6, 'gutem', 'gutem@gmail.com', '823c1e79fcc29f803cf147e90983e7a8d0bfb5a5');

CREATE TABLE Newsletter (
   	id INT(100) AUTO_INCREMENT, -- primary key column
    idUtilisateur int(100) NOT NULL,
    nom INT (100) NOT NULL,
    texte TINYTEXT NOT NULL ,
	email VARCHAR(255)COLLATE utf8mb4_unicode_520_ci NOT NULL,
	motDePasse VARCHAR (255) COLLATE utf8mb4_unicode_520_ci,
	PRIMARY KEY (id),
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(id)
);

-- INSERT INTO `Commantaire` (`id`, `nom`, `image`, `email`,) VALUES
-- (1, 'bello', 'bello.png', 'bello@gmail.com', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (2, 'jose', 'jose.png', 'jose@gmail.com', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (3, 'celi', 'celi.png', 'celi@gmail.com', 'bla bla bla','2008/25/05'),--.SSH ET encriptado

-- Create a new table called 'articles
	CREATE TABLE Article (
    id INT(100) AUTO_INCREMENT,
 	idUtilisateur INT(100) NOT NULL, -- foreign key,
    image LONGBLOB,-- descr blob, revisar cual es de las 2
    texte TEXT COLLATE utf8mb4_unicode_520_ci NOT NULL,
    datePublication VARCHAR(255),
	PRIMARY KEY (id), -- primary key column
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(id)
);

-- INSERT INTO `Article` (`id`, `pseudo`, `image`, `texte`,  `datePublication`) VALUES
-- (1, 'bello', 'bello', 'bello.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (1, 'jose', 'jose', 'jose.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (1, 'bertrand', 'bertrand', 'bertrand.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (1, 'chokrim', 'chokrim', 'chokrim.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado(1, 'bello', 'bello', 'bello.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado

-- Create a new table called 'comment'
	CREATE TABLE Commentaire (
   	id INT(100) AUTO_INCREMENT PRIMARY KEY, -- primary key column
    idUtilisateur INT(100) NOT NULL, -- foreign key,
    idArticle INT (100) NOT NULL, 
    datePublication DATETIME NOT NULL,
	texte TINYTEXT NOT NULL,
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(id),
   	FOREIGN KEY (idArticle) REFERENCES article(id)
   );

-- INSERT INTO `Commantaire` (`id`, `pseudo`, `image`, `texte`,  `datePublication`) VALUES
-- (1, 'bello', 'bello', 'bello.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (2, 'jose', 'jose', 'jose.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (3, 'bertrand', 'bertrand', 'bertrand.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado
-- (4, 'chokrim', 'chokrim', 'chokrim.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado(1, 'bello', 'bello', 'bello.png', 'bla bla bla','2008/25/05'),--.SSH ET encriptado

CREATE TABLE Contact
(
    id INT(100) AUTO_INCREMENT,  -- primary key column
  	idUtilisateur INT(100) NOT NULL, -- foreign key,
	gender VARCHAR(1000) NOT NULL  COLLATE utf8mb4_unicode_520_ci,
	nom VARCHAR (255) NOT NULL  COLLATE utf8mb4_unicode_520_ci,
	prenom VARCHAR (255) NOT NULL COLLATE utf8mb4_unicode_520_ci,
    dateNaissance DATE NOT NULL,
	titreJob VARCHAR (255) NOT NULL COLLATE utf8mb4_unicode_520_ci,
    website varchar(1000) NOT NULL COLLATE utf8mb4_unicode_520_ci,
	adresse VARCHAR (255) NOT NULL COLLATE utf8mb4_unicode_520_ci,
	numero INT (9) not null,
	cp INT (100) NOT NULL,
	ville VARCHAR(1000) NOT NULL COLLATE utf8mb4_unicode_520_ci,
 	pays VARCHAR(1000) NOT NULL COLLATE utf8mb4_unicode_520_ci,
	tel INT (100) NOT NULL,
	email VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_520_ci,
    motPasse VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_520_ci,
	PRIMARY KEY (id),
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(id)
  );
  
 
-- A REVISAR LA MANERA DE INTRODUCIR LAS REQUETTES
-- création de la requête 1 SQL:
-- $sql = "INSERT  INTO personnes (cat, pseudo, prenom, titrejob, gender, dateNaissance, adresse,  cp, ville, pays, website, telephone, email, motPasse)
-- VALUES ( '$cat','$nom', '$prenom', '$adresse', '$cp','$ville', '$pays', '$qualif','$tel', '$email', '$motPasse') " ;

-- création de la requête 2 SQL: a reviser
-- $sql = "INSERT  INTO personnes ( `id, `pseudo`, `prenom`,`titrejob`,  `gender`,  `dateNaissance`, `adresse`,  `numero` `cp`, `ville`, `pays`, `website`,  `tel`,  `email`, `motPasse)
-- VALUES  (null, Aguila, Jose, Développeur, homme, 22.04.974, Rue du Rhône, 4, 1205, Genève, Suisse, aj.web-concept.ch,  +41(0)789531205, aj.webconcept@gmail.com, blackbull) ";


-- Create a new table called 'CreationSiteWeb'
CREATE TABLE CreationSiteWeb
(
	gender VARCHAR(1000) NOT NULL,
    id INT(100) AUTO_INCREMENT PRIMARY KEY, -- primary key column
	nom VARCHAR (255) NOT NULL,
	prenom VARCHAR (255) NOT NULL,
	titreJob VARCHAR (255) NOT NULL,
	website varchar(1000) NOT NULL,
	dateNaissance DATE NOT NULL,
	adresse VARCHAR (255) NOT NULL,
	numero INT (9) not null,
	cp INT (100) NOT NULL,
	ville VARCHAR(1000) NOT NULL,
 	pays VARCHAR(1000) NOT NULL,
	tel INT (100) NOT NULL,
	email VARCHAR(255) NOT NULL,
    motPasse VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
  );ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create a new table called 'DevisWebSite'
CREATE TABLE CreationSiteWeb
(
	gender VARCHAR(1000) NOT NULL,
    id INT(100) AUTO_INCREMENT PRIMARY KEY, -- primary key column
	nom VARCHAR (255) NOT NULL,
	prenom VARCHAR (255) NOT NULL,
	titreJob VARCHAR (255) NOT NULL,
	website varchar(1000) NOT NULL,
	
	--ICI TOUTES LES NOUVELLES DONNéES DE LE FORMULAIRE DEVIS SITE WEB
	--titlewebresponsive()
	--webDestop(checkbox)
	--webMobile(checkbox)
	--webTabllet(checkbox)
	
	dateNaissance DATE NOT NULL,
	adresse VARCHAR (255) NOT NULL,
	numero INT (9) not null,
	cp INT (100) NOT NULL,
	ville VARCHAR(1000) NOT NULL,
 	pays VARCHAR(1000) NOT NULL,
	tel INT (100) NOT NULL,
	email VARCHAR(255) NOT NULL,
    motPasse VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
  );ENGINE=InnoDB DEFAULT CHARSET=utf8;



















