--CREATE DATABASE extracurriculares;

DROP VIEW IF EXISTS view_booking;
DROP VIEW IF EXISTS view_email;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS materias;

CREATE TABLE students(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL,
  parent VARCHAR(200) NOT NULL,
  parent2 VARCHAR(200),
  turma INTEGER,
  finished BOOLEAN DEFAULT FALSE
);

CREATE TABLE users(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  parent VARCHAR(200),
  turma INTEGER,
  finished BOOLEAN DEFAULT FALSE
);

CREATE TABLE roles(
  email VARCHAR(200) NOT NULL UNIQUE,
  roles VARCHAR(500) NOT NULL DEFAULT ''
);

/* senha: janeiro */
INSERT INTO roles VALUES('danilo.salexan@gmail.com', 'admin');
INSERT INTO roles VALUES('tarcisio.rodrigues@professor.colegioplanck.com.br', 'admin');


CREATE TABLE materias (
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  core VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL,
  weekday INTEGER[] NOT NULL DEFAULT '{}',
  starttime TIME[] NOT NULL DEFAULT '{}',
  endtime TIME[] NOT NULL DEFAULT '{}',
  maximum INTEGER DEFAULT NULL,
  minimum INTEGER DEFAULT NULL,
  inscritos INTEGER DEFAULT NULL,
  credit INTEGER DEFAULT NULL, 

  tags VARCHAR(20)[] NOT NULL DEFAULT '{}',

  turmas INTEGER[] DEFAULT NULL
);

CREATE TABLE booking (
  student VARCHAR(100) NOT NULL,
  materia VARCHAR(100) NOT NULL,
  status INTEGER NOT NULL DEFAULT 0,

  timestamp TIMESTAMPTZ DEFAULT NULL
);

CREATE TABLE emails (
  id SERIAL PRIMARY KEY,
  "user" VARCHAR(100) NOT NULL,
  timestamp TIMESTAMPTZ DEFAULT NULL
);

CREATE OR REPLACE VIEW view_booking AS
SELECT B.*, M.weekday, M.starttime, M.endtime
FROM (
  WITH stack AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY  materia ORDER BY timestamp ASC) AS position
    FROM booking
  )
    SELECT s.*
    FROM stack s
    WHERE status IN (1, 2)
  UNION
    SELECT *, null as position
    FROM booking
    WHERE status = 0
) AS B LEFT JOIN
materias M ON B.materia = M._id;


CREATE OR REPLACE VIEW view_email AS
SELECT E.*, S.name, S.email, S.parent
FROM emails AS E
LEFT JOIN students AS S ON E."user" = S._id;
