CREATE SCHEMA IF NOT EXISTS `journals` DEFAULT CHARACTER SET utf8 ;
use journals;
CREATE TABLE IF NOT EXISTS user
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    enabled BIT(1) NOT NULL,
    login_name VARCHAR(255) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS item
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS publisher
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    user_id BIGINT(20) NOT NULL,
    CONSTRAINT FK_ml1xc0aovqkkm2p1lssgjkfas FOREIGN KEY (user_id) REFERENCES user (id)
);
CREATE TABLE IF NOT EXISTS category
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS journal
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    publish_date DATETIME NOT NULL,
    uuid VARCHAR(255),
    category_id BIGINT(20) NOT NULL,
    publisher_id BIGINT(20) NOT NULL,
    CONSTRAINT FK_c7picib39dl7kxro2349cnpn9 FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    CONSTRAINT FK_category_journal FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE INDEX FK_c7picib39dl7kxro2349cnpn9 ON journal (publisher_id);
CREATE INDEX FK_category_journal ON journal (category_id);
CREATE UNIQUE INDEX UK_ml1xc0aovqkkm2p1lssgjkfas ON publisher (user_id);
CREATE TABLE IF NOT EXISTS subscription
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME NOT NULL,
    user_id BIGINT(20) NOT NULL,
    category_id BIGINT(20) NOT NULL,
    CONSTRAINT FK_subscription_category FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE UNIQUE INDEX UK_tq3cq3gmsss8jjyb2l5sb1o6k ON subscription (user_id);