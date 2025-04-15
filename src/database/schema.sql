CREATE DATABASE user_db;

\c user_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (name, email, password) VALUES 
    ('Luiz', 'Luiz@gmail.com', 'amods'),
    ('lucas', 'luccas@gmail.com', 'amods'),
    ('João', 'joao@gmail.com', 'amods');

INSERT INTO posts (title, content, user_id) VALUES 
    ('Post 1', 'Conteúdo do post 1', 1),
    ('Post 2', 'Conteúdo do post 2', 2),
    ('Post 3', 'Conteúdo do post 3', 3);