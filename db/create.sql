CREATE DATABASE extracurriculares;

DROP VIEW IF EXISTS view_booking;
DROP VIEW IF EXISTS view_email;

DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS materias;

CREATE TABLE users(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(500) NOT NULL, /* ENCRYPT */
  name VARCHAR(200) NOT NULL,
  turma INTEGER NOT NULL,
  finished BOOLEAN DEFAULT FALSE
);

/* senha: janeiro */
INSERT INTO users VALUES('admin', 'admin', '5ae58945f8ade0980e6d7f55da047c9a6d2a89b2a3f64ba741299f076a622c9e2c23f7492b3587f375101fc6cddb8089c8abe2cf9708a2559343af153e9a367fe09875d434107db0b4acccff957c5a67', 'Admin',5, FALSE);


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
  student VARCHAR(100) NOT NULL,
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
    WHERE status = 1
  UNION
    SELECT *, null as position
    FROM booking
    WHERE status != 1
) AS B LEFT JOIN
materias M ON B.materia = M._id;


CREATE OR REPLACE VIEW view_email AS
SELECT E.*, U.name, U.email
FROM emails AS E
LEFT JOIN users AS U ON E.student = U._id;
