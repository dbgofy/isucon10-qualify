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
    INDEX       IX_estate_rent_id(rent, id),
    INDEX       IX_estate_rent_popularity(rent, popularity)
);

CREATE TABLE isuumo.door_geom
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    g           POINT               NOT NULL,
    SPATIAL INDEX(g)
);

CREATE TABLE isuumo.chair_geom
    id          INTEGER             NOT NULL PRIMARY KEY,
    g           GEOMETRY            NOT NULL,
    SPATIAL INDEX(g)
);

CREATE TABLE isuumo.estate_location
(
    id          INTEGER             NOT NULL PRIMARY KEY,
		location    POINT               NOT NULL,
    SPATIAL     INDEX(location)
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    stock_flag  BOOLEAN         NOT NULL DEFAULT TRUE,
    INDEX IX_chairs_stock_flag_price(stock_flag, price),
    INDEX IX_chairs_stock_flag_kind_popularity(stock_flag, kind, popularity),
    INDEX IX_chairs_stock_flag_height(stock_flag, height),
    INDEX IX_chairs_stock_flag_color_popularity(stock_flag, color, popularity)
);
