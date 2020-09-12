CREATE TABLE box_office (
rank INT PRIMARY KEY,
released INT,
movie TEXT,
total_box_office INT
);

CREATE TABLE streaming (
id INT PRIMARY KEY,
title TEXT,
released INT,
suggested_viewing_age TEXT,
imdb TEXT,
rotten_tomatoes TEXT,
netflix TEXT,
hulu TEXT,
prime_video TEXT,
disney_plus TEXT,
directors TEXT,
genres TEXT,
language TEXT,
runtime INT
);


