USE isuumo;
UPDATE estate SET door_min = LEAST(door_width, door_height), door_max = GREATEST(door_width, door_height);
