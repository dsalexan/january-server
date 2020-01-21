DROP VIEW IF EXISTS view_booking;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS materias;
DROP TABLE IF EXISTS booking;

CREATE TABLE users(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL, /* ENCRYPT */
  name VARCHAR(200) NOT NULL,
  turma INTEGER NOT NULL
);

/* senha: janeiro */
INSERT INTO users VALUES('admin', 'admin', '$2b$10$0fZdIcxiq3jRRCT549Jdzupmu3fW7VVqvEa1DE/2J4ic0.7cmYvGq', 'Admin',5);


CREATE TABLE materias (
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  core VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL,
  weekday INTEGER[] NOT NULL DEFAULT '{}',
  starttime TIME[] NOT NULL DEFAULT '{}',
  endtime TIME[] NOT NULL DEFAULT '{}',
  maximum INTEGER DEFAULT NULL,

  tags VARCHAR(20)[] NOT NULL DEFAULT '{}',

  turmas INTEGER[] DEFAULT NULL
);

CREATE TABLE booking (
  student VARCHAR(100) NOT NULL,
  materia VARCHAR(100) NOT NULL,
  status INTEGER NOT NULL DEFAULT 0,

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
