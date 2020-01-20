DROP TABLE IF EXISTS users;
CREATE TABLE users(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL, /* ENCRYPT */
  name VARCHAR(200) NOT NULL,
  turma INTEGER NOT NULL
);

/* senha: janeiro */
INSERT INTO users VALUES('admin', 'admin', '$2b$10$0fZdIcxiq3jRRCT549Jdzupmu3fW7VVqvEa1DE/2J4ic0.7cmYvGq', 'Admin',5);


DROP TABLE IF EXISTS materias;
CREATE TABLE materias (
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  core VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL,
  weekday INTEGER[] NOT NULL DEFAULT '{}',
  starttime TIME[] NOT NULL DEFAULT '{}',
  endtime TIME[] NOT NULL DEFAULT '{}',
  maximum INTEGER DEFAULT NULL,

  tags VARCHAR(20)[] NOT NULL DEFAULT '{}',

  turmas INTEGER[] DEFAULT '{}'
);

INSERT INTO materias VALUES('materia.teste 2',
                            'Núcleo Planck de Artes',
                            'Teste 2',
                            ARRAY[2, 5],
                            ARRAY['12:00'::TIME, '19:30'::TIME],
                            ARRAY['13:30'::TIME, '21:00'::TIME],
                            30,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
  student VARCHAR(100) NOT NULL,
  materia VARCHAR(100) NOT NULL,
  status INTEGER NOT NULL DEFAULT 0,

  timestamp TIMESTAMPTZ DEFAULT NULL
);