use isuumo
UPDATE chair SET stock_flag = stock > 0;
UPDATE estate SET rent_category = IF rent <= 50000 THEN 0 ELSEIF rent <= 100000 THEN 1 ELSEIF rent <= 150000 THEN 2 ELSE 3;
