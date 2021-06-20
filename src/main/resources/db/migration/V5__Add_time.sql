ALTER TABLE comment ADD `post_date` DATETIME;

ALTER TABLE usr ADD `registration_date` DATETIME;

UPDATE usr SET registration_date=CURRENT_DATE - INTERVAL 3 DAY WHERE id=1;
UPDATE usr SET registration_date=CURRENT_DATE - INTERVAL 2 DAY WHERE id=2;
UPDATE usr SET registration_date=CURRENT_DATE - INTERVAL 1 DAY WHERE id=3;
