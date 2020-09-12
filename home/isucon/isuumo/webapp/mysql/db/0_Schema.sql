DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    rent_category INTEGER NOT NULL DEFAULT 0,
    INDEX       IX_estate_rent_id(rent, id),
    INDEX       IX_estate_rent_category_popularity(rent_category, popularity)
);

CREATE TABLE isuumo.estate_location
(
    id          INTEGER             NOT NULL PRIMARY KEY,
		location    POINT               NOT NULL,
    SPATIAL     INDEX(location)
);

CREATE TABLE isuumo.chair
(
    id              INTEGER      NOT NULL PRIMARY KEY,
    name            VARCHAR(64)  NOT NULL,
    description     VARCHAR(4096)NOT NULL,
    thumbnail       VARCHAR(128) NOT NULL,
    price           INTEGER      NOT NULL,
    height          INTEGER      NOT NULL,
    width           INTEGER      NOT NULL,
    depth           INTEGER      NOT NULL,
    color           VARCHAR(64)  NOT NULL,
    features        VARCHAR(64)  NOT NULL,
    kind            VARCHAR(64)  NOT NULL,
    popularity      INTEGER      NOT NULL,
    stock           INTEGER      NOT NULL,
    stock_flag      BOOLEAN      NOT NULL DEFAULT TRUE,
    price_range_id  INTEGER      NOT NULL DEFAULT -1,
    height_range_id INTEGER      NOT NULL DEFAULT -1,
    INDEX IX_chairs_stock_flag_price_popularity(stock_flag, price, popularity),
    INDEX IX_chairs_stock_flag_price_range_id_popularity(stock_flag, price_range_id, popularity),
    INDEX IX_chairs_stock_flag_height_range_id_popularity(stock_flag, height_range_id, popularity),
    INDEX IX_chairs_stock_flag_kind_popularity(stock_flag, kind, popularity),
    INDEX IX_chairs_stock_flag_height_popularity(stock_flag, height, popularity),
    INDEX IX_chairs_stock_flag_color_popularity(stock_flag, color, popularity)
);
