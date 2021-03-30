INSERT INTO cinema_room(cinema_room_id, cinema_room_name, seat_quantity) VALUES (1, 'CinemaRoom 1', 20);
INSERT INTO cinema_room(cinema_room_id, cinema_room_name, seat_quantity) VALUES (2, 'CinemaRoom 2', 22);
INSERT INTO cinema_room(cinema_room_id, cinema_room_name, seat_quantity) VALUES (3, 'CinemaRoom 3', 23);
 

INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(1, '09:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(1, '12:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(1, '15:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(1, '23:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(2, '09:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(2, '20:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(2, '22:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(2, '23:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(3, '09:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(3, '20:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(3, '21:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(3, '22:00', 1);
INSERT INTO [dbo].[schedule]( [cinemaroom_id],[schedule_time],[status])VALUES(3, '23:00', 1);


INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 1, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 2, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 3, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 4, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 5, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 6, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 7, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 8, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 9, 1, 1, 1);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('A', 10, 1, 1, 1);


INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 1, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 2, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 3, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 4, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 5, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 6, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 7, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 8, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 9, 1, 1, 2);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('B', 10, 1, 1, 2);

INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 1, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 2, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 3, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 4, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 5, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 6, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 7, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 8, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 9, 1, 1, 3);
INSERT INTO [dbo].[seat]([seat_column],[seat_row],[seat_status],[seat_type],[cinema_room_id])VALUES('C', 10, 1, 1, 3);
		   

INSERT INTO [dbo].[type]([type_name])VALUES('Humor');
INSERT INTO [dbo].[type]([type_name])VALUES('Act');
INSERT INTO [dbo].[type]([type_name])VALUES('Affection');
INSERT INTO [dbo].[type]([type_name])VALUES('Type4');

INSERT INTO [dbo].[roles]([role_name])VALUES('ROLE_ADMIN');
INSERT INTO [dbo].[roles]([role_name])VALUES('ROLE_EMPLOYEE');
INSERT INTO [dbo].[roles]([role_name])VALUES('ROLE_MEMBER');

INSERT INTO [dbo].[account]([account_id],[address],[email],[full_name],[gender],[password],[user_name],[role_id], [status] )VALUES('huylv','Ha Noi','admin123@gmail.com','Le Van Huy','M','$2a$10$KMExHUGfmHhUlto/lJ2NF.eTNsSLmIHZv71IXr/2vFIRio4ZkY31C','admin123',1, 1);