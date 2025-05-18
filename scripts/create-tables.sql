DROP TABLE IF EXISTS Aulas_assistidas CASCADE;
DROP TABLE IF EXISTS Estudante CASCADE;
DROP TABLE IF EXISTS Instrutor CASCADE;
DROP TABLE IF EXISTS Aula CASCADE;

CREATE TABLE Estudante (
    estudanteID SERIAL PRIMARY KEY,
    nome        VARCHAR(100),
    curso       VARCHAR(100)
);

CREATE TABLE Instrutor (
    instrutorID SERIAL PRIMARY KEY,
    curso       VARCHAR(100)
);

CREATE TABLE Aula (
    aulaID      SERIAL PRIMARY KEY,
    instituicao VARCHAR(100),
    cidade      VARCHAR(100),
    estado      VARCHAR(100)
);

CREATE TABLE Aulas_assistidas (
    estudanteID  INT  NOT NULL,
    instrutorID  INT  NOT NULL,
    aulaID       INT  NOT NULL,
    notas        DECIMAL(5,2),

    CONSTRAINT fk_estudante
        FOREIGN KEY (estudanteID)
        REFERENCES Estudante (estudanteID),

    CONSTRAINT fk_instrutor
        FOREIGN KEY (instrutorID)
        REFERENCES Instrutor (instrutorID),

    CONSTRAINT fk_aula
        FOREIGN KEY (aulaID)
        REFERENCES Aula (aulaID)
);

INSERT INTO Estudante (nome, curso)
VALUES
  ('Alice Martins',      'Engenharia'),
  ('Bruno Machado',      'Direito'),
  ('Carla Silva',        'Medicina'),
  ('Daniel Moura',       'Engenharia'),
  ('Eduarda Fernandes',  'Arquitetura'),
  ('Fábio Santos',       'Direito'),
  ('Giulia Nunes',       'Medicina');

INSERT INTO Instrutor (curso)
VALUES
  ('Direito'),
  ('Arquitetura'),
  ('Engenharia'),
  ('Medicina');

INSERT INTO Aula (instituicao, cidade, estado)
VALUES
  ('Univille',           'Joinville',     'Santa Catarina'),
  ('UFSC',               'Florianópolis', 'Santa Catarina'),
  ('PUC-PR',             'Curitiba',      'Paraná'),
  ('Unicamp',            'Campinas',      'São Paulo'),
  ('Univali',            'Itajaí',        'Santa Catarina');

INSERT INTO Aulas_assistidas (estudanteID, instrutorID, aulaID, notas)
VALUES
    -- Aulas em Joinville (aulaID = 1, "Univille")  -------------------------
    (1, 3, 1,  82.5),   -- Alice (Engenharia)   tendo aula com InstrutorID=3 (Engenharia) em Joinville
    (2, 1, 1,  75.0),   -- Bruno (Direito)      com InstrutorID=1 (Direito) em Joinville
    (3, 4, 1,  69.0),   -- Carla (Medicina)     com InstrutorID=4 (Medicina) em Joinville
    (4, 1, 1,  88.0),   -- Daniel (Engenharia)  com InstrutorID=1 (Direito) em Joinville
    (5, 2, 1,  77.0),   -- Eduarda (Arq.)       com InstrutorID=2 (Arq.)     em Joinville

    -- Aulas em Florianópolis (aulaID = 2, "UFSC") --------------------------
    (1, 1, 2,  90.0),   -- Alice (Engenharia)   x Instrutor (Direito)   - SC
    (2, 3, 2,  60.0),   -- Bruno (Direito)      x Instrutor (Engenharia)- SC
    (3, 2, 2,  72.5),   -- Carla (Medicina)     x Instrutor (Arq.)      - SC
    (6, 3, 2,  48.0),   -- Fábio (Direito)      x Instrutor (Engenharia)- SC
    (7, 4, 2,  95.0),   -- Giulia (Medicina)    x Instrutor (Medicina)  - SC

    -- Aulas em Curitiba (aulaID = 3, "PUC-PR") -----------------------------
    (2, 3, 3,  84.0),   -- Bruno (Direito)      x Instrutor (Engenharia)
    (4, 2, 3,  70.0),   -- Daniel (Engenharia)  x Instrutor (Arq.)
    (5, 1, 3,  66.0),   -- Eduarda (Arq.)       x Instrutor (Direito)
    (7, 3, 3,  74.5),   -- Giulia (Medicina)    x Instrutor (Engenharia)

    -- Aulas em Campinas (aulaID = 4, "Unicamp") ----------------------------
    (1, 1, 4,  58.0),   -- Alice (Engenharia)   x Instrutor (Direito)
    (2, 2, 4,  82.0),   -- Bruno (Direito)      x Instrutor (Arq.)
    (3, 4, 4,  75.5),   -- Carla (Medicina)     x Instrutor (Medicina)
    (6, 1, 4,  88.0),   -- Fábio (Direito)      x Instrutor (Direito)
    (7, 3, 4,  45.0),   -- Giulia (Medicina)    x Instrutor (Engenharia)

    -- Aulas em Itajaí (aulaID = 5, "Univali") ------------------------------
    (3, 2, 5,  93.0),   -- Carla (Medicina)     x Instrutor (Arq.)
    (4, 4, 5,  79.0),   -- Daniel (Engenharia)  x Instrutor (Medicina)
    (5, 3, 5,  86.5),   -- Eduarda (Arq.)       x Instrutor (Engenharia)
    (6, 2, 5,  55.5),   -- Fábio (Direito)      x Instrutor (Arq.)
    (7, 1, 5,  81.0);   -- Giulia (Medicina)    x Instrutor (Direito)
