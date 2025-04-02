CREATE TABLE IF NOT EXISTS Genres (
    id INTEGER PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
    id INTEGER PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_Genre (
    artist_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

CREATE TABLE IF NOT EXISTS Albums (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Artist_Album (
    artist_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track_Collection (
    track_id INTEGER NOT NULL,
    collection_id INTEGER NOT NULL,
    PRIMARY KEY (track_id, collection_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(id),
    FOREIGN KEY (collection_id) REFERENCES Collections(id)
);
