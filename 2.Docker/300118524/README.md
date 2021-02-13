# ÉTAPES DE CONCEPTION DE NOTRE IMAGE

## :one: CRÉATION DES SOURCES

### :a: Repertoire db : contient un fichier articles.sql, qui renferme toute l'architecture de la base de données.

``
CREATE DATABASE IF NOT EXISTS test CHARACTER SET utf8;
CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost';


USE test;

CREATE TABLE IF NOT EXISTS articles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    content TEXT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO articles (title, author, content) VALUES
("Qu'est-ce qu'un Dockerfile ?", 'zoureni', " Un Dockerfile est un fichier texte décrivant les différentes étapes permettant de partir d'une base pour aller $

``

### :b:	Repertoire app : comporte les sources php de notre l'application web.
