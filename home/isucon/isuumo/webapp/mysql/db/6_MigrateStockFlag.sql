use isuumo
UPDATE chair SET stock_flag = stock > 0;
UPDATE estate SET rent_category = (CASE WHEN rent <= 50000 THEN 0 WHEN rent <= 100000 THEN 1 WHEN rent <= 150000 THEN 2 ELSE 3 END);
