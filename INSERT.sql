INSERT INTO Genres (id, name) VALUES
  (1, 'Rock'),
  (2, 'Pop'),
  (3, 'Jazz')
ON CONFLICT (id) DO NOTHING;

INSERT INTO Artists (id, name) VALUES
  (1, 'Queen'),
  (2, 'The Beatles'),
  (3, 'Michael Jackson'),
  (4, 'Frank Sinatra')
ON CONFLICT (id) DO NOTHING;

INSERT INTO Albums (id, title, release_year) VALUES
  (1, 'A Night at the Opera', 1975),
  (2, 'Abbey Road', 1969),
  (3, 'Thriller', 1982),
  (4, 'In the Wee Small Hours', 1955),
  (5, 'Collaboration Album', 2021)
ON CONFLICT (id) DO NOTHING;

INSERT INTO Tracks (id, title, duration, album_id) VALUES
  (1, 'Bohemian Rhapsody', '00:05:55', 1),
  (2, 'Youre My Best Friend', '00:02:50', 1),
  (3, 'Come Together', '00:04:18', 2),
  (4, 'Something', '00:03:03', 2),
  (5, 'Beat It', '00:04:18', 3),
  (6, 'Billie Jean', '00:04:54', 3),
  (7, 'In the Wee Small Hours of the Morning', '00:02:59', 4),
  (8, 'Lonely Track', '00:03:45', 1),
  (9, 'my own', '00:03:00', 1),
  (10, 'own my', '00:03:00', 1),
  (11, 'my', '00:03:00', 1),
  (12, 'oh my god', '00:03:00', 1),
  (13, 'myself', '00:03:00', 1),
  (14, 'by myself', '00:03:00', 1),
  (15, 'bemy self', '00:03:00', 1),
  (16, 'myself by', '00:03:00', 1),
  (17, 'by myself by', '00:03:00', 1),
  (18, 'beemy', '00:03:00', 1),
  (19, 'premyne', '00:03:00', 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO Collections (id, title, release_year) VALUES
  (1, 'Greatest Rock Hits', 2020),
  (2, 'Legendary Pop Anthology', 2019),
  (3, 'Classic Jazz Collection', 2021),
  (4, 'Timeless Classics', 2022)
ON CONFLICT (id) DO NOTHING;


INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
  (1, 1),  
  (2, 1),  
  (3, 2),  
  (4, 3),
  (1, 2)
ON CONFLICT (artist_id, genre_id) DO NOTHING;

INSERT INTO Artist_Album (artist_id, album_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (1, 5),
  (3, 5)
ON CONFLICT (artist_id, album_id) DO NOTHING;

INSERT INTO Track_Collection (track_id, collection_id) VALUES
  (1, 1),
  (2, 1), 
  (5, 2),
  (6, 2),
  (7, 3),
  (3, 4),
  (4, 4)
ON CONFLICT (track_id, collection_id) DO NOTHING;