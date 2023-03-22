-- add authors
INSERT INTO AUTHORS (author_name)
VALUES  ('Bring Me The Horizon'), ('Carpenter Brut'), ('Celldweller'),
		('Detach'), ('Fatal FE'), ('Imagine Dragons'), ('Linkin Park'),
		('Sum 41');
		
-- add genres
INSERT INTO GENRES (genre_name)
VALUES  ('Hard Rock'), ('Electronic'), ('Alternative'), ('Rock'), ('Metal');

-- add author-genre links
INSERT INTO AUTHOR_GENRE (author_id, genre_id)
VALUES  (26, 1), (27, 2), (28, 3), (29, 3), 
		(30, 4), (30, 5), (31, 3), (32, 1), (33, 4);
		
-- add albums
INSERT INTO ALBUMS (album_name, release_year)
VALUES  ('Sempiternal (Deluxe)', 2013), ('Trilogy', 2015), ('Offworld', 2017),
		('Offworld (Instrumental)', 2017), ('D.R.A.M.A', 2018),
		('Music of the Spheres', 2019), ('We Are the One - Single', 2020),
		('Bones - Single', 2021), ('Evolve', 2018), ('Mercury - Act 1', 2021),
		('Night Visions (Deluxe)', 2012), ('Origins (Deluxe)', 2018),
		('Smoke + Mirrors (Deluxe)', 2015), ('Hybrid Theory', 2000),
		('Meteora', 2003), ('Minutes to Midnight (Deluxe Edition)', 2007),
		('Chuck', 2004), ('Order in Decline', 2019)
		
-- add author-album links
INSERT INTO AUTHOR_ALBUM (author_id, album_id)
VALUES  (26, 2), (27, 3), (28, 4), (28, 5), (29, 6), (30, 7), (30, 8), (31, 9),
		(31, 10), (31, 11), (31, 12), (31, 13), (31, 14), (32, 15), (32, 16),
		(32, 17), (33, 18), (33, 19);
		
-- add tracks
INSERT INTO TRACKS (album_id, track_name, track_length)
VALUES  (2, 'Sleepwalking', 105), (3, 'Anarchy Road', 140),
		(4, 'My Echoes', 120), (5, 'Echoes (Instrumental)', 120),
		(6, 'Supernova', 95), (7, 'Infinite Worlds', 150),
		(8, 'We Are the One', 160), (9, 'Bones', 210), 
		(10, 'Believer', 160), (11, 'Follow You', 190),
		(12, 'My Demons', 250), (13, 'Machine', 150),
		(14, 'Smoke and Mirrors', 240), (15, 'Points of my Authority', 170),
		(16, 'Numb', 230), (17, 'Across The Line (Bonus Track)', 250),
		(18, 'We are All To Blame', 150), (19, '45 (A Matter of Time)', 180);
		
-- add compilations
INSERT INTO COMPILATIONS (compilation_name, release_year)
VALUES  ('2004-2013', 2017), ('Demo Vault: Wasteland', 2021),
		('Remixed Upon a Blackstar', 2018),
		('Wish Upon a Blackstar (Remix Contest Compilation)', 2018),
		('Debut Remixes Vol. 02', 2018), ('Debut Remixes Vol. 01', 2017),
		('Remixed Upon a Blackstar (Instrumentals)', 2018),
		('Studio Collection 2000-2012', 2013);
		
-- add track-compilation links
INSERT INTO TRACK_COMPILATION (track_id, compilation_id)
VALUES  (1, 5), (1, 4), (2, 4), (3, 7), (3, 8), (4, 2), (4, 3), (5, 8), (5, 5),
		(6, 8), (6, 4), (7, 4), (7, 3), (8, 6), (8, 7), (9, 5), (10, 4), (10, 1),
		(11, 2), (11, 1), (12, 5), (12, 6), (13, 8), (14, 6), (14, 7), (15, 2),
		(15, 1), (16, 5), (17, 4), (17, 8), (18, 6);

INSERT INTO tracks (album_id, track_name, track_length)
VALUES  (12, 'ItDoes NotExist Likely', 254), 
		(13, 'ThisDefinitely Does NotExits', 538);

INSERT INTO TRACK_COMPILATION (track_id, compilation_id)
VALUES (19, 6);
