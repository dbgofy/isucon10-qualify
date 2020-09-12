INSERT INTO isuumo.door_geom SELECT id, POINT(MIN(door_height, door_width), MAX(door_height, door_width)) FROM isuumo.estate;
