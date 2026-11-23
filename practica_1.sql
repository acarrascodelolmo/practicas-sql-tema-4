-- Ejercicio 1. Cada fila representa un animal alojado en ParaiZoo.
CREATE TABLE ParaiZooHuesped (
    id INTEGER PRIMARY KEY,
    animal TEXT NOT NULL,
    nombre TEXT NOT NULL,
    sexo TEXT NOT NULL CHECK (sexo IN ('Macho', 'Hembra')),
    fecha_nacimiento DATE,
    alimentacion TEXT NOT NULL,
    fecha_incorporacion DATE NOT NULL,
    comida_diaria_kg DECIMAL(7,3) NOT NULL,
    jaula INTEGER NOT NULL,
    peso_llegada_kg DECIMAL(8,3) NOT NULL
);

-- Ejercicio 2. Parches cumple dos años el 20/09/2019. Los 250 g son 0,250 kg.
INSERT INTO ParaiZooHuesped (
    animal, nombre, sexo, fecha_nacimiento, alimentacion,
    fecha_incorporacion, comida_diaria_kg, jaula, peso_llegada_kg
) VALUES
    ('Conejo', 'Parches', 'Macho', '2017-09-20', 'Herbívoro', '2019-09-13', 0.250, 24, 1.5);

-- Ejercicio 3. Spirit y Perla ingresan el mismo día. La pava es omnívora.
INSERT INTO ParaiZooHuesped (
    animal, nombre, sexo, fecha_nacimiento, alimentacion,
    fecha_incorporacion, comida_diaria_kg, jaula, peso_llegada_kg
) VALUES
    ('Caballo', 'Spirit', 'Macho', '2009-08-07', 'Herbívoro', '2019-10-02', 3, 15, 230),
    ('Pava', 'Perla', 'Hembra', '2018-09-21', 'Omnívoro', '2019-10-02', 0.500, 23, 42);

-- Ejercicio 4. La fecha de nacimiento de Fresa es desconocida.
INSERT INTO ParaiZooHuesped (
    animal, nombre, sexo, fecha_nacimiento, alimentacion,
    fecha_incorporacion, comida_diaria_kg, jaula, peso_llegada_kg
) VALUES
    ('Tigresa', 'Fresa', 'Hembra', NULL, 'Carnívoro', '2019-11-20', 4, 31, 42);

-- Ejercicio 5. También se desconoce cuándo nació Nilo.
INSERT INTO ParaiZooHuesped (
    animal, nombre, sexo, fecha_nacimiento, alimentacion,
    fecha_incorporacion, comida_diaria_kg, jaula, peso_llegada_kg
) VALUES
    ('Cocodrilo', 'Nilo', 'Macho', NULL, 'Carnívoro', '2019-12-12', 5, 47, 44);
