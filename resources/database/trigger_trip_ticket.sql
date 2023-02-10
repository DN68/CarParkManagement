use car_park
GO
-- ==================== TRIGGER CREATE TICKET ==================== 
CREATE OR ALTER TRIGGER TRG_ADD_TICKET 
ON ticket AFTER INSERT AS
BEGIN 
	DECLARE @trip_id INT = (SELECT trip_id FROM inserted)
	-- kiểm tra nếu booking_ticket_number = max_ticket thì rolLback
	DECLARE @max_ticket INT = (SELECT maximum_online_ticket_number FROM trip WHERE trip_id = @trip_id) -- max ticket
	DECLARE @ticket_number INT = (SELECT booked_ticket_number FROM trip WHERE trip_id = @trip_id)
	IF (@ticket_number < @max_ticket)
		BEGIN
			UPDATE trip SET booked_ticket_number = booked_ticket_number + 1 
			WHERE trip_id = @trip_id
		END
END
GO
-- ==================== TRIGGER DELETE TICKET ====================
CREATE OR ALTER TRIGGER TRG_DELETE_TICKET
ON ticket AFTER DELETE AS
BEGIN
	DECLARE @trip_id INT = (SELECT trip_id FROM deleted)
	UPDATE trip SET booked_ticket_number = booked_ticket_number - 1
	WHERE trip_id = @trip_id
	SELECT * FROM trip
END
GO
-- ==================== TRIGGER UPDATE TICKET ====================
CREATE OR ALTER TRIGGER TRG_UPDATE_TICKET 
ON ticket AFTER UPDATE AS
BEGIN
	DECLARE @trip_id_old INT = (SELECT trip_id FROM deleted)
	DECLARE @trip_id_new INT = (SELECT trip_id FROM inserted)
	DECLARE @max_ticket INT = (SELECT maximum_online_ticket_number FROM trip WHERE trip_id = @trip_id_new)
	DECLARE @ticket_number INT = (SELECT booked_ticket_number FROM trip WHERE trip_id = @trip_id_new)

	IF (@ticket_number < @max_ticket)
		BEGIN
			UPDATE trip SET booked_ticket_number = booked_ticket_number - 1
			WHERE trip_id = @trip_id_old

			UPDATE trip SET booked_ticket_number = booked_ticket_number + 1
			WHERE trip_id = @trip_id_new
		END
	SELECT * FROM trip
END
-- =============================================================================================

SELECT * FROM ticket
SELECT * FROM trip
SELECT * FROM car

DELETE FROM ticket WHERE ticket_id = 87

UPDATE ticket SET trip_id = 111 WHERE ticket_id = 86

GO
INSERT INTO [ticket]([booking_time],[customer_name]
           ,[license_plate],[trip_id])
     VALUES('12:20', 'Nguyen Khoi', '0228-2129', 111)
SELECT * FROM ticket
SELECT * FROM trip

/*

- Nếu number_ticket = max_ticket -> không cho nó add/update (trên java)

*/