DROP TABLE IF EXISTS receipt;
DROP TABLE IF EXISTS receipt_meta;
DROP TABLE IF EXISTS commission;
DROP TABLE IF EXISTS known_words;

CREATE TABLE receipt_meta (
    r_id INTEGER PRIMARY KEY NOT NULL,
    u_id INTEGER SECONDARY KEY NOT NULL,
    r_status INTEGER NOT NULL DEFAULT 0,
    date_upload TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    a_id INTEGER NOT NULL,
    date_approved TIMESTAMP,
    date_payed TIMESTAMP,
    FOREIGN KEY (r_id) REFERENCES receipt (r_id)
);

CREATE TABLE receipt (
    r_id INTEGER PRIMARY KEY AUTOINCREMENT,
    c_id INTEGER NOT NULL,
    descript TEXT NOT NULL,
    price REAL NOT NULL,
    date_bought TEXT NOT NULL,
    btw INTEGER,
    r_img BLOB NOT NULL,
    FOREIGN KEY (c_id) REFERENCES commission (c_id)
);

CREATE TABLE commission (
    c_id INTEGER PRIMARY KEY AUTOINCREMENT,
    c_name TEXT NOT NULL
);

CREATE TABLE known_words (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    c_id INTEGER SECONDARY KEY NOT NULL, -- 0 is comission, 1 is item
    word TEXT NOT NULL,
    btw REAL,
    price REAL
);