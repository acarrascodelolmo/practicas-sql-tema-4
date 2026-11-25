-- Ejercicio 1. Producciones estadounidenses, de mayor a menor popularidad.
SELECT id, title, popularity, vote_average, release_date, production_countries
FROM movies
WHERE production_countries LIKE '%United States%'
ORDER BY popularity DESC;

-- Ejercicio 2. Nota de 5 o menos, primero las películas con más votos.
SELECT id, title, popularity, vote_average, vote_count, production_countries
FROM movies
WHERE production_countries LIKE '%United States%' AND vote_average <= 5
ORDER BY vote_count DESC;

-- Ejercicio 3. Estrenos japoneses entre las 22:00 y las 05:00, inclusive.
-- moviebig.db guarda solo el día. Exigimos una hora explícita para evitar
-- que SQLite interprete una fecha sin hora como un estreno a medianoche.
SELECT id, title, popularity, vote_average, DATE(release_date) AS fecha_estreno,
       TIME(release_date) AS hora_estreno, production_countries
FROM movies
WHERE production_countries LIKE '%Japan%'
  AND release_date LIKE '%:%'
  AND (TIME(release_date) >= '22:00:00' OR TIME(release_date) <= '05:00:00');

-- Ejercicio 4. Producciones de los cuatro países indicados.
SELECT id, title, release_date, vote_average, popularity, production_countries
FROM movies
WHERE production_countries LIKE '%Japan%' OR production_countries LIKE '%China%'
   OR production_countries LIKE '%India%' OR production_countries LIKE '%Korea%'
ORDER BY production_countries ASC, release_date ASC;

-- Ejercicio 5. Tomamos el primer título disponible.
SELECT production_countries, original_language, title,
       COALESCE(NULLIF(TRIM(original_title), ''), NULLIF(TRIM(title), ''), 'Sin título') AS NombreFinal
FROM movies
ORDER BY production_countries ASC;

-- Ejercicio 6. La base usa Spain para el país y guarda las productoras en JSON.
-- Leer cada nombre en el JSON recupera también la ñ de España.
SELECT title, production_countries, original_language, homepage, vote_average
FROM movies
WHERE production_countries LIKE '%Spain%' OR production_countries LIKE '%España%'
   OR EXISTS (
       SELECT 1
       FROM json_each(movies.production_companies) AS empresa
       WHERE json_extract(empresa.value, '$.name') LIKE '%España%'
          OR json_extract(empresa.value, '$.name') LIKE '%Spain%'
   );
