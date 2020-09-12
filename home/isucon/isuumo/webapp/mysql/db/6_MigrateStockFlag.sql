use isuumo
UPDATE chair SET stock_flag = stock > 0;
UPDATE estate SET rent_category = IF rent <= 50000 THEN 0 ELSEIF rent <= 100000 THEN 1 ELSEIF rent <= 150000 THEN 2 ELSE 3;
ALTER TABLE chair ADD INDEX IX_chairs_stock_flag_price(stock_flag, price);
ALTER TABLE chair ADD INDEX IX_chairs_stock_flag_kind(stock_flag, kind);
ALTER TABLE chair ADD INDEX IX_chairs_stock_flag_height(stock_flag, height);
ALTER TABLE chair ADD INDEX IX_chairs_stock_flag_color_popularity(stock_flag, color, popularity);
