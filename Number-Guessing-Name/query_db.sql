

create table users();

alter table users add column user_id serial not null;

alter table users add column username VARCHAR(22) UNIQUE NOT NULL;

alter table users add column frequent_games INTEGER DEFAULT 0 NOT NULL;

create table games();

alter table games add column game_id serial not null;

alter table games add column user_id integer not null;

alter table games add best_guess INTEGER DEFAULT 0 NOT NULL;


ALTER TABLE users ADD PRIMARY KEY (user_id);
ALTER TABLE games ADD PRIMARY KEY (game_id);
ALTER TABLE games ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
