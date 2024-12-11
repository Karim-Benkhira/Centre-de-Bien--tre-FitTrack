CREATE DATABASE FitTrack;

USE FitTrack;

CREATE TABLE departements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    emplacement VARCHAR(255)
);

CREATE TABLE entraineurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    date_naissance DATE,
    sexe CHAR(1) CHECK (sexe IN ('M', 'F')),
    telephone VARCHAR(15),
    email VARCHAR(255),
    departement_id INT,
    FOREIGN KEY (departement_id) REFERENCES departements(id) ON DELETE CASCADE
);

CREATE TABLE membres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    date_naissance DATE,
    sexe CHAR(1) CHECK (sexe IN ('M', 'F')),
    telephone VARCHAR(15),
    email VARCHAR(255)
);

CREATE TABLE salles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE abonnements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    membre_id INT,
    salle_id INT,
    date_debut DATE,
    date_fin DATE,
    montant DECIMAL(10, 2),
    FOREIGN KEY (membre_id) REFERENCES membres(id) ON DELETE CASCADE,
    FOREIGN KEY (salle_id) REFERENCES salles(id)
);

CREATE TABLE rendezvous (
    id INT AUTO_INCREMENT PRIMARY KEY,
    membre_id INT,
    entraineur_id INT,
    date_heure DATETIME,
    FOREIGN KEY (membre_id) REFERENCES membres(id) ON DELETE CASCADE,
    FOREIGN KEY (entraineur_id) REFERENCES entraineurs(id) ON DELETE CASCADE
);

CREATE TABLE supplements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    description TEXT,
    entraineur_id INT,
    FOREIGN KEY (entraineur_id) REFERENCES entraineurs(id) ON DELETE CASCADE
);

CREATE TABLE programmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    description TEXT,
    duree INT
);

CREATE TABLE personnel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    poste VARCHAR(255)
);





INSERT INTO departements (nom, emplacement) VALUES
('Musculation', 'Building A'),
('Cardio', 'Building B'),
('Yoga', 'Building C'),
('Pilates', 'Building D'),
('CrossFit', 'Building E'),
('Boxing', 'Building F'),
('Zumba', 'Building G'),
('Cycling', 'Building H'),
('Swimming', 'Building I'),
('Stretching', 'Building J');




INSERT INTO entraineurs (nom, date_naissance, sexe, telephone, email, departement_id) VALUES
('John Smith', '1985-06-15', 'M', '1234567890', 'john@example.com', 1),
('Jane Doe', '1990-07-20', 'F', '0987654321', 'jane@example.com', 2),
('Mike Brown', '1988-03-25', 'M', '1122334455', 'mike@example.com', 3),
('Sara White', '1992-11-10', 'F', '2233445566', 'sara@example.com', 4),
('Chris Black', '1995-08-15', 'M', '3344556677', 'chris@example.com', 5),
('Emily Green', '1987-04-22', 'F', '4455667788', 'emily@example.com', 6),
('James Blue', '1993-09-17', 'M', '5566778899', 'james@example.com', 7),
('Sophia Red', '1989-01-05', 'F', '6677889900', 'sophia@example.com', 8),
('Daniel Grey', '1991-12-14', 'M', '7788990011', 'daniel@example.com', 9),
('Olivia Pink', '1994-06-28', 'F', '8899001122', 'olivia@example.com', 10);


INSERT INTO membres (nom, date_naissance, sexe, telephone, email) VALUES
('Alex Johnson', '1990-07-15', 'M', '1234567890', 'alex@example.com'),
('Emily Clark', '1988-08-25', 'F', '1231231234', 'emily@example.com'),
('Michael King', '1995-03-05', 'M', '9876543210', 'michael@example.com'),
('Laura Davis', '1992-11-13', 'F', '4567891230', 'laura@example.com'),
('David Miller', '1987-04-18', 'M', '3216549870', 'david@example.com'),
('Anna Brown', '1985-12-29', 'F', '6549871230', 'anna@example.com'),
('Brian Wilson', '1991-09-21', 'M', '7891234560', 'brian@example.com'),
('Sophia Adams', '1989-10-11', 'F', '4561237890', 'sophia@example.com'),
('Chris Evans', '1993-05-22', 'M', '9517538520', 'chris@example.com'),
('Emma Watson', '1990-02-19', 'F', '7539514560', 'emma@example.com');


INSERT INTO salles (nom) VALUES
('Salle 1'),
('Salle 2'),
('Salle 3'),
('Salle 4'),
('Salle 5'),
('Salle 6'),
('Salle 7'),
('Salle 8'),
('Salle 9'),
('Salle 10');


INSERT INTO abonnements (membre_id, salle_id, date_debut, date_fin, montant) VALUES
(1, 1, '2024-01-01', '2024-12-31', 500),
(2, 2, '2024-02-01', '2024-12-31', 600),
(3, 3, '2024-03-01', '2024-12-31', 550),
(4, 4, '2024-04-01', '2024-12-31', 450),
(5, 5, '2024-05-01', '2024-12-31', 650),
(6, 6, '2024-06-01', '2024-12-31', 700),
(7, 7, '2024-07-01', '2024-12-31', 750),
(8, 8, '2024-08-01', '2024-12-31', 800),
(9, 9, '2024-09-01', '2024-12-31', 550),
(10, 10, '2024-10-01', '2024-12-31', 600);


INSERT INTO rendezvous (membre_id, entraineur_id, date_heure) VALUES
(1, 1, '2024-01-10 10:00:00'),
(2, 2, '2024-01-11 11:00:00'),
(3, 3, '2024-01-12 12:00:00'),
(4, 4, '2024-01-13 13:00:00'),
(5, 5, '2024-01-14 14:00:00'),
(6, 6, '2024-01-15 15:00:00'),
(7, 7, '2024-01-16 16:00:00'),
(8, 8, '2024-01-17 17:00:00'),
(9, 9, '2024-01-18 18:00:00'),
(10, 10, '2024-01-19 19:00:00');


INSERT INTO supplements (nom, description, entraineur_id) VALUES
('Whey Protein', 'High-quality protein supplement', 1),
('BCAA', 'Branched-Chain Amino Acids', 2),
('Pre-Workout', 'Boosts energy and focus', 3),
('Multivitamins', 'Essential vitamins and minerals', 4),
('Fish Oil', 'Rich in omega-3 fatty acids', 5),
('Creatine', 'Enhances muscle strength', 6),
('Protein Bars', 'Healthy snacks for athletes', 7),
('L-Carnitine', 'Aids in fat loss', 8),
('Collagen', 'Supports skin and joint health', 9),
('ZMA', 'Improves sleep and recovery', 10);


INSERT INTO programmes (nom, description, duree) VALUES
('Muscle Building', 'Intense weightlifting program', 60),
('Fat Loss', 'High-intensity cardio and diet plan', 45),
('Endurance Training', 'Long-distance running and cycling', 90),
('Strength Training', 'Heavy lifting and resistance exercises', 75),
('Yoga Basics', 'Introduction to yoga and meditation', 30),
('Advanced Yoga', 'Challenging poses and breathing techniques', 45),
('CrossFit Basics', 'Functional fitness training for beginners', 40),
('Powerlifting', 'Focusing on squat, bench, and deadlift', 70),
('Pilates Core', 'Core-strengthening exercises', 50),
('Swimming Techniques', 'Improving strokes and speed', 80);


INSERT INTO personnel (nom, poste) VALUES
('Admin 1', 'Receptionist'),
('Admin 2', 'Manager'),
('Admin 3', 'Cleaner'),
('Admin 4', 'Accountant'),
('Admin 5', 'Trainer Assistant'),
('Admin 6', 'Maintenance'),
('Admin 7', 'Security Guard'),
('Admin 8', 'IT Support'),
('Admin 9', 'Marketing Specialist'),
('Admin 10', 'Event Coordinator');




SELECT COUNT(*) AS total_membres FROM membres;
SELECT COUNT(*) AS total_entraineurs FROM entraineurs;
SELECT AVG(montant) AS moyenne_abonnement FROM abonnements;
SELECT sexe, COUNT(*) AS nombre_membres FROM membres GROUP BY sexe;


SELECT nom,
    TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) < 18 THEN 'Junior'
        WHEN TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) BETWEEN 18 AND 64 THEN 'Adulte'
        ELSE 'Senior'
    END AS categorie_age
FROM membres;


SELECT r.date_heure, e.nom AS nom_entraineur, m.nom AS nom_membre
FROM rendezvous r
JOIN entraineurs e ON r.entraineur_id = e.id
JOIN membres m ON r.membre_id = m.id;

SELECT a.*, s.nom AS nom_salle
FROM abonnements a
JOIN salles s ON a.salle_id = s.id;

SELECT d.nom AS nom_departement, COUNT(e.id) AS nombre_entraineurs
FROM departements d
JOIN entraineurs e ON d.id = e.departement_id
GROUP BY d.nom;

DELETE FROM rendezvous WHERE date_heure < '2024-01-01';

UPDATE departements
SET nom = 'Force et Conditionnement'
WHERE nom = 'Musculation';


CREATE VIEW abonnements_actifs AS
SELECT *
FROM abonnements
WHERE date_fin >= CURDATE();

CREATE VIEW membres_par_sexe AS
SELECT sexe, COUNT(*) AS total
FROM membres
GROUP BY sexe;


CREATE INDEX idx_entraineur_id ON rendezvous(id_entraineur);
CREATE INDEX idx_departement_id ON rendezvous(id_departement);


ALTER TABLE membres ADD CONSTRAINT unique_email UNIQUE(email);
ALTER TABLE membres ADD CONSTRAINT unique_phone UNIQUE(telephone);


ALTER TABLE membres ADD CONSTRAINT check_gender CHECK (sexe IN ('Male', 'Female'));


ALTER TABLE membres ADD CONSTRAINT check_birthdate CHECK (date_naissance < CURRENT_DATE);





