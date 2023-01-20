CREATE DATABASE IF NOT EXISTS studi_booking CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE theater(
    id_theater INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    adress VARCHAR(60) NOT NULL 
)engine=INNOBD;

CREATE TABLE movie(
    id_movie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    duration TIME NOT NULL,
    genre VARCHAR(30) NOT NULL,
    year YEAR NOT NULL,
    author VARCHAR(30) NOT NULL,
    description VARCHAR(200) NOT NULL
)engine=INNOBD;

CREATE TABLE rate(
    id_rate INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    price FLOAT NOT NULL,
    description VARCHAR(30) NOT NULL
)engine=INNOBD;

CREATE TABLE payment(
    id_payment INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(30) NOT NULL
)engine=INNOBD;

CREATE TABLE booking(
    id_booking INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    group_number INT NOT NULL,
    paymentid INT NOT NULL,
    FOREIGN KEY (paymentid) REFERENCES payment(id_payment),
    rateid INT NOT NULL,
    FOREIGN KEY (rateid) REFERENCES rate (id_rate)
)engine=INNOBD;

CREATE TABLE user(
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    password VARCHAR(100) NOT NULL 
)engine=INNOBD;

CREATE TABLE administrator(
    id_administrator INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    password VARCHAR(100) NOT NULL UNIQUE 
)engine=INNOBD;

CREATE TABLE sessions(
    id_sessions INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    session_hour TIME NOT NULL,
    date DATE NOT NULL,
    theaterid INT NOT NULL,
    FOREIGN KEY (theaterid) REFERENCES theater(id_theater),
    movieid INT NOT NULL,
    FOREIGN KEY (movieid) REFERENCES movie (id_movie)
)engine=INNOBD;

CREATE TABLE room(
    id_room INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    room_number INT NOT NULL,
    seat_number INT NOT NULL,
    description VARCHAR(10) NOT NULL,
    sessionid INT NOT NULL,
    FOREIGN KEY (sessionid) REFERENCES sessions(id_sessions)
)engine=INNOBD;

INSERT INTO theater (id_theater, name, adress) VALUES (1, 'Realmix', '889 Crowley Plaza');
INSERT INTO theater (id_theater, name, adress) VALUES (2, 'Feednation', '3 Pankratz Hill');
INSERT INTO theater (id_theater, name, adress) VALUES (3, 'Miboo', '1 Holmberg Court');
INSERT INTO theater (id_theater, name, adress) VALUES (4, 'Vinte', '31 Oak Point');
INSERT INTO theater (id_theater, name, adress) VALUES (5, 'Gabtype', '20 Rieder Trail');

INSERT INTO movie (id_movie, title, duration, genre, year, author, description) VALUES (1, 'Nope', '1:20', 'thriller', '2022', 'Jordan Peele', 'Les habitants d’une vallée perdue du fin fond de la Californie sont témoins d’une découverte terrifiante à caractère surnaturel.');
INSERT INTO movie (id_movie, title, duration, genre, year, author, description) VALUES (2, 'Geri s Game', '1:30', 'comédie', '2022', 'Burton Tom', 'Deux frères que tout oppose. Antoine, marié, deux enfants, conducteur de bateaux, et Christian, célibataire, chômeur et bagarreur incorrigible.');
INSERT INTO movie (id_movie, title, duration, genre, year, author, description) VALUES (3, 'Darkest Night', '2:30', 'policier', '2022', 'Francisco Dumphy', 'Sur Inisherin deux compères de toujours, Padraic et Colm, se retrouvent dans une impasse lorsque Colm décide du jour au lendemain de mettre fin à leur amitié.  ');
INSERT INTO movie (id_movie, title, duration, genre, year, author, description) VALUES (4, 'They All Lie', '2:00', 'horror', '2022', 'Calidda Murrigan', 'Alors qu’ils attendent leur premier enfant, Claire et Arthur décident de renouer les liens familiaux.');

INSERT INTO sessions (id_sessions, session_hour, date, theaterid, movieid) VALUES (1, '9:38', '2023-04-12', 1, 1);
INSERT INTO sessions (id_sessions,  session_hour, date, theaterid, movieid) VALUES (2,'12:34', '2023-03-18', 2, 2);
INSERT INTO sessions (id_sessions,  session_hour, date, theaterid, movieid) VALUES (3,'10:30', '2023-02-02', 4, 3);
INSERT INTO sessions (id_sessions,  session_hour, date, theaterid, movieid) VALUES (4,'7:30', '2023-02-12', 5, 3);
INSERT INTO sessions (id_sessions,  session_hour, date, theaterid, movieid) VALUES (5,'22:40', '2023-04-22', 3, 4);

 
INSERT INTO rate (id_rate, price, description) VALUES (1, '9.20', 'plein tarif');
INSERT INTO rate (id_rate, price, description) VALUES (2, '7.60', 'étudiant');
INSERT INTO rate (id_rate, price, description) VALUES (3, '5.90', 'moins de 14ans');

INSERT INTO payment (id_payment, description) VALUES (1, 'en ligne');
INSERT INTO payment (id_payment, description) VALUES (2, 'sur place');

INSERT INTO booking (id_booking, client_name, date, group_number, paymentid, rateid) VALUES (1, 'Cedric Gormar','2023-04-12', 2, 1, 1);
INSERT INTO booking (id_booking, client_name, date, group_number, paymentid, rateid) VALUES (2, 'Natal Lillicrop','2023-03-18', 4, 2, 1);
INSERT INTO booking (id_booking, client_name, date, group_number, paymentid, rateid) VALUES (3, 'Saul Cheales', '2023-02-02', 1 , 2, 2);
INSERT INTO booking (id_booking, client_name, date, group_number, paymentid, rateid) VALUES (4, 'Mair Peckitt','2023-02-12', 3,  1, 3);
INSERT INTO booking (id_booking, client_name, date, group_number, paymentid, rateid) VALUES (5, 'Elly Entres', '2023-04-22',2,  1, 3);


INSERT INTO room (id_room, room_number, seat_number, description, sessionid) VALUES (1, 102, 90, '4K', 1);
INSERT INTO room (id_room, room_number, seat_number, description, sessionid) VALUES (2, 202, 100, '3D', 2);
INSERT INTO room (id_room, room_number, seat_number, description, sessionid) VALUES (3, 422, 50, '4DX', 5);
INSERT INTO room (id_room, room_number, seat_number, description, sessionid) VALUES (4, 303, 110, '3D', 3);
INSERT INTO room (id_room, room_number, seat_number, description, sessionid) VALUES (5, 404, 130, '4K', 4);

INSERT INTO user (id_user, name, email, password) VALUES (1, 'Saul Cheales', 'saulcheales@exemple.com', '$2y$10$ze4xJ13Z1ucmz0t8m2crBep9AncbF5c6go/5Runt8fkBAhsRNzroK');
INSERT INTO user (id_user, name, email, password) VALUES (2, 'Marlow Jersh', 'marlojersh@exemple.com', '$2y$10$2zPHFtEo4i/HlAopUUeGQ.qX1ShejZXiiqZ6oxdPQT3dOaUuJAFSW');
INSERT INTO user (id_user, name, email, password) VALUES (3, 'Berny Pea', 'bernypea@exemple.com', '$2y$10$gykxTAYWksiE/avFTC44FuXtG9lEc/wxyHTN7xEZJzUqjqkhiPKeC');
INSERT INTO user (id_user, name, email, password) VALUES (4, 'Saul Cheales', 'saulcheales@exemple.com', '$2y$10$tA.c8jZk7W3xRDcNiD7Fa.I/0vNXJsawBvQOuB5GpfR1p9TWhcsa2');

INSERT INTO administrator (id_administrator, name, email, password) VALUES (1, 'Perle Scholig', 'perlescholig@exemple.com', '$2y$10$k48K1p7DkwCO6DMAcNCo1.LaNxMzn4HZGrlDyxA/eDQzkYPVal6QW');
INSERT INTO administrator (id_administrator, name, email, password) VALUES (2, 'Dallas Smalles', 'dallassmalles@exemple.com', '$2y$10$k8M.l1sV4jSpWQEIqYQDEOG1FvScIT.Nh5wXBl7KZ5PYUVC1uSW9S');
INSERT INTO administrator (id_administrator, name, email, password) VALUES (3, 'Nev Trip', 'nevtrip@exemple.com', '$2y$10$4BcrofgOhfUxzkUOWNbMd.DMO1XDEiDYrWYaxpijbmX9udlx1wggG');
INSERT INTO administrator (id_administrator, name, email, password) VALUES (4, 'Doby Béal', 'dobybéal@exemple.com', '$2y$10$byJaiopOJCTUc0tUFmkFVO9XkNYbpI95Ak6LsKONE0uyKYdjpvraS');

CREATE USER 'admin'@'localhost' IDENTIFIED by '$2y$10$HBMYtE.Xcpqgg8tSulzX7uomHN.PH7Agt55c8JFbarK9yWJTigOKO';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'lambda'@'localhost' IDENTIFIED by '$2y$10$Tqc8sXf1b/G4550RYjJiwuJPqjsRLzKFrZiCsbkaDXTL9z5FXXmde';
GRANT SELECT ON *.* TO 'lambda'@'localhost';
FLUSH PRIVILEGES;