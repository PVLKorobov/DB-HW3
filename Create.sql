CREATE TABLE IF NOT EXISTS authors (
	id SERIAL PRIMARY KEY,
	author_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) UNIQUE NOT NULL,
	release_year SMALLINT CHECK(release_year <= 2023 AND release_year > 0)
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES albums(id),
	track_name VARCHAR(60) UNIQUE NOT NULL,
	track_length INTEGER CHECK(track_length > 0)
);

CREATE TABLE IF NOT EXISTS compilations (
	id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(60) UNIQUE NOT NULL,
	release_year INTEGER CHECK(release_year <= 2023 AND release_year > 0)
);

CREATE TABLE IF NOT EXISTS author_genre (
	id SERIAL PRIMARY KEY,
	author_id INTEGER REFERENCES authors(id),
	genre_id INTEGER REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS author_album (
	id SERIAL PRIMARY KEY,
	author_id INTEGER REFERENCES authors(id),
	album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS track_compilation (
	id SERIAL PRIMARY KEY,
	track_id INTEGER REFERENCES tracks(id),
	compilation_id INTEGER REFERENCES compilations(id)
);