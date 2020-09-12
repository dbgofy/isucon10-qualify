use isuumo
UPDATE chair SET stock_flag = stock > 0;
UPDATE estate SET rent_category = (CASE WHEN rent <= 50000 THEN 0 WHEN rent <= 100000 THEN 1 WHEN rent <= 150000 THEN 2 ELSE 3 END);

UPDATE chair SET price_range_id = CASE 
  WHEN price < 3000 THEN 0
  WHEN 3000 <= price AND price < 6000 THEN 1
  WHEN 6000 <= price AND price < 9000 THEN 2
  WHEN 9000 <= price AND price < 12000 THEN 3
  WHEN 12000 <= price AND price < 15000 THEN 4
  WHEN 15000 <= price THEN 5
END, height_range_id = CASE
  WHEN height < 80 THEN 0
  WHEN 80 <= height AND height < 110 THEN 1
  WHEN 110 <= height AND height < 150 THEN 2
  WHEN 150 <= height THEN 3
END;
