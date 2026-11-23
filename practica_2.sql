-- Ejercicio 1. Películas estrenadas cuya recaudación no supera su presupuesto.
SELECT title, revenue AS recaudacion, budget
FROM movies
WHERE status = 'Released'
  AND revenue <= budget;

-- Ejercicio 2. Películas con Terminator en el título.
SELECT title, release_date
FROM movies
WHERE LOWER(title) LIKE '%terminator%';

-- Ejercicio 3. Películas de más de dos horas.
SELECT title, runtime, vote_average
FROM movies
WHERE runtime > 120;

-- Ejercicio 4. Películas pendientes de estreno según su estado.
SELECT title, status, budget
FROM movies
WHERE status <> 'Released';

-- Ejercicio 5. Buena valoración y mención a god en el resumen (búsqueda LIKE de clase).
SELECT title, vote_average, overview
FROM movies
WHERE vote_average > 7
  AND LOWER(overview) LIKE '%god%';

-- Ejercicio 6. Más de mil votos y nota media de cinco o menos.
SELECT title, vote_count, vote_average, release_date
FROM movies
WHERE vote_count > 1000
  AND vote_average <= 5;

-- Ejercicio 7. Alta popularidad y mención a alien en el resumen.
SELECT title, popularity, release_date, vote_average
FROM movies
WHERE popularity > 100
  AND LOWER(overview) LIKE '%alien%';

-- Ejercicio 8. Estrenos anteriores a 1980.
SELECT title, vote_average, release_date
FROM movies
WHERE status = 'Released'
  AND date(release_date) < '1980-01-01';

-- Ejercicio 9. Lemas de más de cien caracteres.
SELECT title, LENGTH(tagline) AS longitud_tagline, popularity, tagline
FROM movies
WHERE LENGTH(tagline) > 100;

-- Ejercicio 10. Duración conocida de una hora o menos.
SELECT title, release_date, runtime, vote_average
FROM movies
WHERE runtime > 0
  AND runtime <= 60;
