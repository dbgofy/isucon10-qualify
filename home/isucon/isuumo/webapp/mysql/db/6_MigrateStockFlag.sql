use isuumo
UPDATE chair SET stock_flag = stock > 0;

UPDATE chair SET price_range_id = CASE 
  WHEN price < 3000 THEN 0
  WHEN 3000 <= price AND price < 6000 THEN 1
  WHEN 6000 <= price AND price < 9000 THEN 2
  WHEN 9000 <= price AND price < 12000 THEN 3
  WHEN 12000 <= price AND price < 15000 THEN 4
  WHEN 15000 <= price THEN 5
END;
