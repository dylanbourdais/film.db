CREATE DATABASE cinema;

SELECT * FROM cinema;

SELECT * FROM film;

SELECT * FROM room;

CREATE TABLE cinema (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nom text UNIQUE NOT NULL,
  address text NOT NULL ,
  zip_code int NOT NULL,
  city text NOT NULL	
);

INSERT INTO cinema (nom , address , zip_code , city) VALUES ('Royal Emeraude Dinard - MGallery Collection', '1 boulevard Albert 1er,' , 35800 ,'DINARD' );

INSERT INTO cinema (nom , address , zip_code , city) VALUES ('PA de l’Hérmitage', '3 Rue des Villes Billy' , 35780,'LA RICHARDAIS' );

CREATE TABLE film  (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nom text UNIQUE NOT NULL,
  acteur text NOT NULL ,
  release_date date NOT NULL,
  times time NOT NULL,
  cinema_id int NOT NULL REFERENCES cinema (id)
);

INSERT INTO film (nom , acteur , release_date , times, cinema_id) VALUES ('ADIEU PARIS' , 'BAER Edouard' , DATE '2022-01-26'  ,  INTERVAL '1:41 hours', 1 );

INSERT INTO film (nom , acteur , release_date , times, cinema_id) VALUES ('UNCHARTED' , 'FLEISCHER Ruben' , DATE '2022-02-16'  ,  INTERVAL '1:56 hours', 2 );


CREATE TYPE room_type AS ENUM ('room 1' , 'room 2' , 'room 3', 'room 4' , 'room 5');

CREATE TABLE room (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  room_cinema room_type NOT NULL,
  film_id int NOT NULL REFERENCES film (id)
);

INSERT INTO room (room_cinema , film_id) VALUES ('room 1' , 1 );

INSERT INTO room (room_cinema , film_id) VALUES ('room 2' , 2 );

