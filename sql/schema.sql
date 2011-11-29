DROP DATABASE Catan;

SET storage_engine=InnoDB;
CREATE DATABASE Catan;
USE Catan;

CREATE TABLE User (
    UserID INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(128) NOT NULL,
    Password CHAR(60) BINARY NOT NULL
);

CREATE TABLE Game (
    GameID INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DateStarted DATETIME NOT NULL,
    GameName VARCHAR(128) NOT NULL,
    CurrentPlayerID INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (CurrentPlayerID) REFERENCES User ( UserID )
);

CREATE TABLE GameCard (
    GameID INTEGER UNSIGNED NOT NULL PRIMARY KEY,
    Knight SMALLINT UNSIGNED NOT NULL,
    Library SMALLINT UNSIGNED NOT NULL,
    Palace SMALLINT UNSIGNED NOT NULL,
    Chapel SMALLINT UNSIGNED NOT NULL,
    University SMALLINT UNSIGNED NOT NULL,
    Market SMALLINT UNSIGNED NOT NULL,
    RoadBuilding SMALLINT UNSIGNED NOT NULL,
    YearOfPlenty SMALLINT UNSIGNED NOT NULL,
    Monopoly SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Game (GameID)
);

CREATE TABLE GamePlayer (
    GameID INTEGER UNSIGNED NOT NULL,
    UserID INTEGER UNSIGNED NOT NULL,
    Color CHAR(6) NOT NULL, -- Hexadecimal color
    PRIMARY KEY (GameID, UserID),
    FOREIGN KEY (GameID) REFERENCES Game (GameID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

CREATE TABLE PlayerCards (
    GameID INTEGER UNSIGNED NOT NULL,
    UserID INTEGER UNSIGNED NOT NULL,
    Brick SMALLINT UNSIGNED NOT NULL,
    Wood SMALLINT UNSIGNED NOT NULL,
    Wheat SMALLINT UNSIGNED NOT NULL,
    Sheep SMALLINT UNSIGNED NOT NULL,
    Ore SMALLINT UNSIGNED NOT NULL,
    Monopoly SMALLINT UNSIGNED NOT NULL,
    Library SMALLINT UNSIGNED NOT NULL,
    Knight SMALLINT UNSIGNED NOT NULL,
    Palace SMALLINT UNSIGNED NOT NULL,
    Chapel SMALLINT UNSIGNED NOT NULL,
    University SMALLINT UNSIGNED NOT NULL,
    Market SMALLINT UNSIGNED NOT NULL,
    RoadBuilding SMALLINT UNSIGNED NOT NULL,
    YearOfPlenty SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (GameID, UserID),
    FOREIGN KEY (GameID) REFERENCES Game (GameID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

CREATE TABLE Hex (
    GameID INTEGER UNSIGNED NOT NULL,
    Vertex TINYINT UNSIGNED NOT NULL,
    Type TINYINT UNSIGNED NOT NULL,
    Chit TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (GameID, Vertex),
    FOREIGN KEY (GameID) REFERENCES Game (GameID)
);

CREATE TABLE Road (
    GameID INTEGER UNSIGNED NOT NULL,
    UserID INTEGER UNSIGNED NOT NULL,
    Vertex1 TINYINT UNSIGNED NOT NULL,
    Vertex2 TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Game (GameID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

CREATE TABLE Settlement (
    GameID INTEGER UNSIGNED NOT NULL,
    UserID INTEGER UNSIGNED NOT NULL,
    Type TINYINT UNSIGNED NOT NULL,
    Vertex TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (GameID, Vertex),
    FOREIGN KEY (GameID) REFERENCES Game (GameID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);

CREATE TABLE Port (
    GameID INTEGER UNSIGNED NOT NULL,
    Vertex TINYINT UNSIGNED NOT NULL,
    Type TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (GameID, Vertex),
    FOREIGN KEY (GameID) REFERENCES Game (GameID)
);

CREATE TABLE Robber (
    GameID INTEGER UNSIGNED NOT NULL,
    Vertex TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (GameID, Vertex),
    FOREIGN KEY (GameID) REFERENCES Game (GameID)
);