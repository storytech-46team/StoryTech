-- Таблица для хранения новелл

CREATE TABLE novels (

    novel_id SERIAL PRIMARY KEY,

    title VARCHAR(255) NOT NULL,

    plot_summary TEXT

);

-- Таблица для хранения глав

CREATE TABLE chapters (

    chapter_id SERIAL PRIMARY KEY,

    title VARCHAR(255),

    chapter_summary TEXT,

    novel_id INTEGER NOT NULL,

    chapter_number INTEGER NOT NULL,

    FOREIGN KEY (novel_id) REFERENCES novels(novel_id) ON DELETE CASCADE

);

-- Таблица для хранения сцен

CREATE TABLE scenes (

    scene_id SERIAL PRIMARY KEY,

    title VARCHAR(255),

    scene_summary TEXT,

    chapter_id INTEGER NOT NULL,

    scene_number INTEGER NOT NULL,

    FOREIGN KEY (chapter_id) REFERENCES chapters(chapter_id) ON DELETE CASCADE

);

-- Таблица для хранения страниц сцены

CREATE TABLE pages (

    page_id SERIAL PRIMARY KEY,

    image_path VARCHAR(255),

    scene_id INTEGER NOT NULL,

    page_number INTEGER NOT NULL,

    FOREIGN KEY (scene_id) REFERENCES scenes(scene_id) ON DELETE CASCADE

);

-- Таблица для хранения реплик

CREATE TABLE replicas (

    replica_id SERIAL PRIMARY KEY,

    text TEXT NOT NULL,

    page_id INTEGER NOT NULL,

    character_id INTEGER,

    replica_number INTEGER NOT NULL,

    FOREIGN KEY (page_id) REFERENCES pages(page_id) ON DELETE CASCADE,

    FOREIGN KEY (character_id) REFERENCES characters(character_id) ON DELETE SET NULL

);
