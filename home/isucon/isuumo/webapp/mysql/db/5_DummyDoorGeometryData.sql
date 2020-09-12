INSERT INTO isuumo.door_geom SELECT id, POINT(LEAST(door_height, door_width), GREATEST(door_height, door_width)) FROM isuumo.estate;
