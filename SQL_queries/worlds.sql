-- Создаем таблицу миров

CREATE TABLE world_ident (

    id SERIAL PRIMARY KEY,           -- Уникальный идентификатор мира

    world_name VARCHAR(50) NOT NULL, -- Название мира

    world_def_text TEXT,             -- Исходное текстовое описание мира

    landscape TEXT,                  -- Описание мирового ландшафта

    settlements_structure TEXT,       -- Устройство населенных пунктов

    housing_structure TEXT            -- Устройство жилых помещений

);

-- Создаем таблицу видов персонажей

CREATE TABLE world_species (

    id SERIAL PRIMARY KEY,               -- Уникальный идентификатор вида персонажа

    world_id INTEGER REFERENCES worlds(id) ON DELETE CASCADE,  -- Ссылка на мир

    species_name VARCHAR(50) NOT NULL,   -- Название вида персонажа

    behavior TEXT,                        -- Поведение персонажей данного вида

    language_communication TEXT,          -- Язык и способы коммуникации

    appearance TEXT,                       -- Внешний вид персонажей

    lifestyle TEXT,                        -- Образ жизни

    social_structure TEXT,                 -- Социальная структура

    values_principles TEXT,                 -- Ценности и принципы

    tech_level TEXT,                       -- Уровень технологического развития

    skills TEXT                            -- Навыки персонажей

);

-- Создаем таблицу географических объектов

CREATE TABLE world_geographical_objects (

    id SERIAL PRIMARY KEY,                  -- Уникальный идентификатор объекта

    world_id INTEGER REFERENCES worlds(id) ON DELETE CASCADE,  -- Ссылка на мир

    object_name VARCHAR(50) NOT NULL,       -- Название объекта

    object_description TEXT,                -- Описание объекта

    object_purpose TEXT,                    -- Его предназначение

    interaction_with_object TEXT,           -- Взаимодействие персонажей с объектом

    object_impact TEXT                      -- Влияние объекта на мир

);
