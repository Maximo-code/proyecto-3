CREATE TABLE IF not EXISTS personaje (
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    role VARCHAR(50)
);
CREATE TABLE IF not EXISTS rutas (
    rutas_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
CREATE TABLE IF NOT EXISTS locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
CREATE TABLE IF NOT EXISTS eventos (
    eventos_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location_id INT,
    rutas_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (rutas_id) REFERENCES rutas(rutas_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    effect TEXT
);
CREATE TABLE IF NOT EXISTS dialogos (
    dialogos_id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT,
    content TEXT,
    eventos_id INT,
    FOREIGN KEY (personaje_id) REFERENCES personaje(personaje_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventos_id) REFERENCES eventos(eventos_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS batallas(
    batallas_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    personaje_id INT,
    FOREIGN KEY (personaje_id) REFERENCES personaje(personaje_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO personaje (name, description, image_url, role) VALUES
('Frisk', 'Protagonista del juego.', 'url_frisk', 'Protagonista'),
('Sans', 'Esqueleto perezoso y gracioso.', 'url_sans', 'NPC');
INSERT INTO rutas (name, description) VALUES
('Ruta Neutral', 'Ruta en la que no se cumple ni el objetivo pacifista ni el genocida.'),
('Ruta Pacifista', 'Ruta en la que no se mata a ningún enemigo.');
INSERT INTO locations (name, description) VALUES
('Ruinas', 'La primera área del juego.'),
('Snowdin', 'Un pueblo nevado lleno de monstruos amables.');
INSERT INTO eventos (name, description, location_id, rutas_id) VALUES
('Encuentro con Toriel', 'Primer encuentro con Toriel en las Ruinas.', 1, 1),
('Batalla con Papyrus', 'Batalla en el pueblo de Snowdin.', 2, 2);
INSERT INTO items (name, description, effect) VALUES
('Poción de Vida', 'Restaura 20 HP.', 'Restaura HP'),
('Espada de Hierro', 'Aumenta el ataque.', 'Aumenta ataque');
INSERT INTO dialogos (personaje_id, content, eventos_id) VALUES
(1, '¡Hola! Soy Toriel.', 1),
(2, '¡Humano, detente!', 2);
INSERT INTO batallas (name, description, personaje_id) VALUES
('Batalla con Toriel', 'Batalla en las Ruinas con Toriel.', 1),
('Batalla con Sans', 'Batalla en el Último Corredor.', 2);













