use isuumo
UPDATE chair SET stock_flag = stock > 0;

INSERT INTO chair_geom 
  SELECT 
    id, 
    ST_AREA(
      ST_GEOMFROMTEXT(
        CONCAT('POLYGON((',
                LEAST(height, width, depth), ' ', (height + width + depth - LEAST(height, width, depth) - GREATEST(height, width, depth)), ', ',
                LEAST(height, width, depth), ' 1000, '
                '1000 1000, ',
                '1000 ', (height + width + depth - LEAST(height, width, depth) - GREATEST(height, width, depth)), '))')
      )
    )
    FROM chair;
