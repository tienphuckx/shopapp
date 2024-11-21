CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTOINCREMENT,
    full_name VARCHAR(100) DEFAULT '',
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(255) DEFAULT '',
    password VARCHAR(255) NOT NULL DEFAULT '',
    created_at DATETIME,
    updated_at DATETIME,
    is_active TINYINT(1) DEFAULT 1,
    date_of_birth DATE,
    facebook_account_id INT DEFAULT 0,
    google_account_id INT DEFAULT 0,
    twitter_account_id INT DEFAULT 0,
    last_login_at DATETIME,
    github_account_id INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tokens (

);