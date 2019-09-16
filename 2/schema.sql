DROP TABLE IF EXISTS provider_project_detail_number;
DROP TABLE IF EXISTS provider;
DROP TABLE IF EXISTS detail;
DROP TABLE IF EXISTS project;

CREATE TABLE provider (
    id     VARCHAR(64)  PRIMARY KEY,
    name   VARCHAR(64)  NOT NULL,
    status SMALLINT     NOT NULL,
    city   VARCHAR(128) NOT NULL
);

CREATE TABLE detail (
    id    VARCHAR(64) PRIMARY KEY,
    name  VARCHAR(64) NOT NULL,
    color VARCHAR(64) NOT NULL,
    size  SMALLINT    NOT NULL,
    city  VARCHAR(64) NOT NULL
);

CREATE TABLE project (
    id   VARCHAR(64) PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    city VARCHAR(64) NOT NULL
);

CREATE TABLE provider_project_detail_number (
    id          SERIAL      PRIMARY KEY,
    provider_id VARCHAR(64) NOT NULL,
    detail_id   VARCHAR(64) NOT NULL,
    project_id  VARCHAR(64) NOT NULL,
    quantity    BIGINT      NOT NULL,
    CONSTRAINT FK_provider_project_detail_number_supplier_id FOREIGN KEY (provider_id) REFERENCES provider(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_provider_project_detail_number_detail_id   FOREIGN KEY (detail_id)   REFERENCES detail(id)   ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_provider_project_detail_number_project_id  FOREIGN KEY (project_id)  REFERENCES project(id)  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO provider(id, name, status, city) VALUES ('П1', 'Петров', 20, 'Москва');
INSERT INTO provider(id, name, status, city) VALUES ('П2', 'Синицын', 10, 'Таллин');
INSERT INTO provider(id, name, status, city) VALUES ('П3', 'Федоров', 30, 'Таллин');
INSERT INTO provider(id, name, status, city) VALUES ('П4', 'Чаянов', 20, 'Минск');
INSERT INTO provider(id, name, status, city) VALUES ('П5', 'Крюков', 30, 'Киев');

INSERT INTO detail(id, name, color, size, city) VALUES ('Д1', 'Болт', 'Красный', 12, 'Москва');
INSERT INTO detail(id, name, color, size, city) VALUES ('Д2', 'Гайка', 'Зеленая', 17, 'Минск');
INSERT INTO detail(id, name, color, size, city) VALUES ('Д3', 'Диск', 'Черный', 17, 'Вильнюс');
INSERT INTO detail(id, name, color, size, city) VALUES ('Д4', 'Диск', 'Черный', 14, 'Москва');
INSERT INTO detail(id, name, color, size, city) VALUES ('Д5', 'Корпус', 'Красный', 12, 'Минск');
INSERT INTO detail(id, name, color, size, city) VALUES ('Д6', 'Крышки', 'Красный', 19, 'Москва');

INSERT INTO project(id, name, city) VALUES ('ПР1', 'ИПР1', 'Минск');
INSERT INTO project(id, name, city) VALUES ('ПР2', 'ИПР2', 'Таллин');
INSERT INTO project(id, name, city) VALUES ('ПР3', 'ИПР3', 'Псков');
INSERT INTO project(id, name, city) VALUES ('ПР4', 'ИПР4', 'Псков');
INSERT INTO project(id, name, city) VALUES ('ПР5', 'ИПР5', 'Москва');
INSERT INTO project(id, name, city) VALUES ('ПР6', 'ИПР6', 'Саратов');
INSERT INTO project(id, name, city) VALUES ('ПР7', 'ИПР7', 'Москва');

INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (1, 'П1', 'Д1', 'ПР1', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (2, 'П1', 'Д1', 'ПР2', 700);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (3, 'П2', 'Д3', 'ПР1', 400);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (4, 'П2', 'Д2', 'ПР2', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (5, 'П2', 'Д3', 'ПР3', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (6, 'П2', 'Д3', 'ПР4', 500);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (7, 'П2', 'Д3', 'ПР5', 600);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (8, 'П2', 'Д3', 'ПР6', 400);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (9, 'П2', 'Д3', 'ПР7', 800);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (10, 'П2', 'Д5', 'ПР2', 100);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (11, 'П3', 'Д3', 'ПР1', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (12, 'П3', 'Д4', 'ПР2', 500);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (13, 'П4', 'Д6', 'ПР3', 300);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (14, 'П4', 'Д6', 'ПР7', 300);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (15, 'П5', 'Д2', 'ПР2', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (16, 'П5', 'Д2', 'ПР4', 100);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (17, 'П5', 'Д5', 'ПР5', 500);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (18, 'П5', 'Д5', 'ПР7', 100);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (19, 'П5', 'Д6', 'ПР2', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (20, 'П5', 'Д1', 'ПР2', 100);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (21, 'П5', 'Д3', 'ПР4', 200);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (22, 'П5', 'Д4', 'ПР4', 800);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (23, 'П5', 'Д5', 'ПР4', 400);
INSERT INTO provider_project_detail_number(id, provider_id, detail_id, project_id, quantity) VALUES (24, 'П5', 'Д6', 'ПР4', 500);
