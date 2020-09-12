use isuumo
UPDATE chair SET stock_flag = stock > 0;
ALTER TABLE chairs ADD INDEX IX_chairs_stock_flag_price(stock_flag, price);
