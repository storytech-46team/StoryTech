-- Таблица курсов

CREATE TABLE education_courses (

    id SERIAL PRIMARY KEY,

    course_name VARCHAR(100) NOT NULL UNIQUE  -- Название курса

);

-- Таблица модулей

CREATE TABLE education_modules (

    id SERIAL PRIMARY KEY,

    course_id INTEGER REFERENCES education_courses(id) ON DELETE CASCADE,  -- Привязка к курсу

    module_name VARCHAR(100) NOT NULL

);

-- Таблица занятий и учебных материалов

CREATE TABLE education_lessons_and_materials (

    id SERIAL PRIMARY KEY,

    module_id INTEGER REFERENCES education_modules(id) ON DELETE CASCADE,  -- Привязка к модулю

    lesson_name VARCHAR(100) NOT NULL,       -- Название занятия

    title VARCHAR(100) NOT NULL,             -- Название учебного материала

    file_path TEXT NOT NULL,                 -- Путь к файлу .docx

    lecture_plan TEXT,                       -- Краткий план лекции

    key_points TEXT                          -- Ключевые моменты лекции

);
