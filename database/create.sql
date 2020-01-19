DROP DATABASE IF EXISTS january;
CREATE DATABASE january;
USE january;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  _id VARCHAR(100) NOT NULL PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL, /* ENCRYPT */
  name VARCHAR(200) NOT NULL
);

/* senha: janeiro */
INSERT INTO users VALUES('admin', 'admin', '$2b$10$0fZdIcxiq3jRRCT549Jdzupmu3fW7VVqvEa1DE/2J4ic0.7cmYvGq', 'Admin');