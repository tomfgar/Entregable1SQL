-- Crear la tabla de usuarios
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Añadir 3 usuarios
INSERT INTO users (first_name, last_name, email) VALUES ('Juan', 'Perez', 'juan@example.com');
INSERT INTO users (first_name, last_name, email) VALUES ('María', 'González', 'maria@example.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Pedro', 'Martínez', 'pedro@example.com');

-- Crear la tabla de posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    creator_id INTEGER REFERENCES users(id),
    title VARCHAR(100),
    text TEXT
);

-- Añadir 5 posts
INSERT INTO posts (creator_id, title, text) VALUES (1, 'Primer post', 'Contenido del primer post');
INSERT INTO posts (creator_id, title, text) VALUES (2, 'Segundo post', 'Contenido del segundo post');
INSERT INTO posts (creator_id, title, text) VALUES (3, 'Tercer post', 'Contenido del tercer post');
INSERT INTO posts (creator_id, title, text) VALUES (1, 'Cuarto post', 'Contenido del cuarto post');
INSERT INTO posts (creator_id, title, text) VALUES (2, 'Quinto post', 'Contenido del quinto post');

-- Crear la tabla de likes
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id)
);

-- Añadir 5 likes
INSERT INTO likes (user_id, post_id) VALUES (1, 2);
INSERT INTO likes (user_id, post_id) VALUES (2, 3);
INSERT INTO likes (user_id, post_id) VALUES (3, 1);
INSERT INTO likes (user_id, post_id) VALUES (1, 4);
INSERT INTO likes (user_id, post_id) VALUES (2, 5);

-- Traer todos los posts y la información del usuario del campo creator_id
SELECT posts.id AS post_id, posts.title, posts.text, users.id AS user_id, users.first_name, users.last_name, users.email
FROM posts
INNER JOIN users ON posts.creator_id = users.id;

-- Traer todos los posts, con la información de los usuarios que les dieron like
SELECT posts.id AS post_id, posts.title, posts.text, users.id AS user_id, users.first_name, users.last_name, users.email
FROM posts
INNER JOIN likes ON posts.id = likes.post_id
INNER JOIN users ON likes.user_id = users.id;
