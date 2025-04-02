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
  (1, 'Bohemian Rhapsody', '5:55', 1),
  (2, 'You''re My Best Friend', '2:50', 1),
  (3, 'Come Together', '4:18', 2),
  (4, 'Something', '3:03', 2),
  (5, 'Beat It', '4:18', 3),
  (6, 'Billie Jean', '4:54', 3),
  (7, 'In the Wee Small Hours of the Morning', '2:59', 4),
  (8, 'Lonely Track', '3:45', 1)
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
  (4, 3)
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