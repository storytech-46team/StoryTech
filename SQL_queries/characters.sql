CREATE TABLE character_ident (	

	id serial,

	name VARCHAR(100) NOT NULL,

	gender VARCHAR(1),

	age INT,

	height FLOAT,

	weight FLOAT,

	hair VARCHAR(100),

	eyes_color VARCHAR(100),

	clothes TEXT,

	features TEXT,

	type VARCHAR(100),

	PRIMARY KEY(id)

);

CREATE TABLE character_def_text (

	character_id INTEGER REFERENCES character_ident(id) ON DELETE CASCADE,

	character_def_text TEXT,

	PRIMARY KEY(character_id)

);

CREATE TABLE character_personality (

	id serial,

	character_id INTEGER REFERENCES character_ident(id) ON DELETE CASCADE,

	aim TEXT,

	main_features TEXT,

	conflicts TEXT,

	valuations TEXT,

	PRIMARY KEY(id)

);

CREATE TABLE character_skills (

	id serial,

	character_id INTEGER REFERENCES character_ident(id) ON DELETE CASCADE,

	prof_skills TEXT,

	hobby TEXT,

	unique_skills TEXT,

	PRIMARY KEY(id)

);

CREATE TABLE character_adds (

	id serial,

	character_id INTEGER REFERENCES character_ident(id) ON DELETE CASCADE,

	relation TEXT,

	reputation TEXT,

	team_role TEXT,

	emotions TEXT,

	triggers TEXT,

	transformation TEXT,

	link TEXT,

	methods TEXT,

	dilemma TEXT,

	background TEXT,

	symbols TEXT,

	world_connection TEXT,

	grows TEXT,

	mistakes TEXT,

	lessons TEXT,

	PRIMARY KEY(id)

);
