use car_park
go

 /*
1: blank 
2: full
3: delete
 */
-- ======================== TRIGGER ADD CAR ========================
CREATE OR ALTER TRIGGER TRG_ADD_CAR
ON car AFTER INSERT AS
BEGIN
	DECLARE @park_id INT = (SELECT park_id FROM inserted)
	DECLARE @quantity_car INT = (SELECT park_quantity FROM parking_lot WHERE park_id = @park_id)
	DECLARE @count_car INT = (SELECT COUNT(*) FROM car WHERE park_id = @park_id)
	IF (@quantity_car = @count_car)
	BEGIN
		UPDATE parking_lot SET park_status = '2' WHERE park_id = @park_id
	END
	UPDATE parking_lot SET park_count = park_count + 1 
		WHERE park_id = @park_id
	SELECT * FROM parking_lot
END
GO

-- INSERT INTO car values('9034-0000', 'Green', 'ftsuka', 'FPTSOFT', 114)

-- ======================== TRIGGER DELETE CAR ========================

CREATE OR ALTER TRIGGER TRG_DELETE_CAR
ON car AFTER DELETE AS
BEGIN
	DECLARE @park_id INT = (SELECT park_id FROM deleted)
	DECLARE @quantity_car INT = (SELECT park_quantity FROM parking_lot WHERE park_id = @park_id)
	DECLARE @count_car INT = (SELECT COUNT(*) FROM car WHERE park_id = @park_id)
	IF (@quantity_car > @count_car)
	BEGIN
		UPDATE parking_lot SET park_status = '1' WHERE park_id = @park_id
	END
	UPDATE parking_lot SET park_count = park_count - 1 
		WHERE park_id = @park_id
	SELECT * FROM parking_lot
END
GO

-- DELETE car WHERE license_plate = '9034-0000'
-- ======================== TRIGGER UPDATE CAR ========================

CREATE OR ALTER TRIGGER TRG_UPDATE_CAR
ON car AFTER UPDATE AS
BEGIN
	DECLARE @park_id_old INT = (SELECT park_id FROM deleted)
	DECLARE @park_status_old CHAR(1) = (SELECT park_status FROM parking_lot WHERE park_id = @park_id_old)

	DECLARE @park_id_new INT = (SELECT park_id FROM inserted)
	DECLARE @quantity_car INT = (SELECT park_quantity FROM parking_lot WHERE park_id = @park_id_new)
	DECLARE @count_car INT = (SELECT COUNT(*) FROM car WHERE park_id = @park_id_new)
	
	-- nếu cái cũ nó đang status = 2 update sang cái khác thì status = 1
	IF (@park_status_old = '2')
	BEGIN 
		UPDATE parking_lot SET park_status = '1' WHERE park_id = @park_id_old
	END
	-- nếu cái mới thêm 1 nữa là status = 2
	IF (@quantity_car = @count_car)
	BEGIN
		UPDATE parking_lot SET park_status = '2' WHERE park_id = @park_id_new
	END
	UPDATE parking_lot SET park_count = park_count - 1 
		WHERE park_id = @park_id_old
	UPDATE parking_lot SET park_count = park_count + 1 
		WHERE park_id = @park_id_new
	SELECT * FROM parking_lot
END

UPDATE car SET park_id = 2 WHERE license_plate = '76237-251'
-- ============================================================
/*
INSERT INTO car values('9034-5839', 'Green', 'ftsuka', 'FPTSOFT', 105)

DELETE FROM car WHERE license_plate = '9034-5839'

UPDATE car SET park_id = 105 WHERE license_plate = '9034-5839'

SELECT * FROM car
SELECT * FROM parking_lot
*/

SELECT * FROM car WHERE license_plate = '' -- CAR ELSE NULL
-- UPDATE  