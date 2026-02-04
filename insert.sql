INSERT INTO roles (role_name) VALUES ('Admin'), ('Customer'), ('TravelAgent'), ('Manager');

INSERT INTO customers (customer_name, customer_gender, customer_email, password_hash, loyalty_points)
VALUES
('Speed', 'Male', 'ishowspeed@gmail.com', 's5mono', 15),
('Kylian', 'Male', 'uselesshattrick@gmail.com', 'n10ber', 19),
('Salomon', 'Female', 'sokona@gmail.com', 'sokosalo1', 21),
('Nicolas', 'Male', 'nicopepe@gmail.com', 'n2002', 32);

INSERT INTO destinations (destination_location, continent, country)
VALUES
('Cotonou', 'Togbin', 'Benin'),
('Lome', 'Calavi', 'Togo'),
('Paris', 'St-denis', 'France'),
('Maputo', 'Moukoko', 'Mozambique');

INSERT INTO flights (airline, takeoff_time, arrival_time, flight_origin, destination_id, seat_class, price, capacity)
VALUES
('Abuja Airlines', '2024-09-14 12:00:00', '2024-09-27 17:00:00', 'Lagos', 1, 'Economy', 600.00, 150),
('Ethiopian Airways', '2024-10-08 14:30:00', '2024-06-07 11:20:00', 'Bamako', 2, 'Business', 2200.00, 50),
('Turkish Airlines', '2024-09-16 07:00:00', '2024-12-08 10:00:00', 'Istanbul', 2, 'Economy', 260.00, 100),
('Benin Airways', '2024-12-12 11:30:00', '2024-04-23 12:30:00', 'Cotonou', 1, 'Business', 880.00, 150);

INSERT INTO accomodations (accomodation_name, destination_id, room_type, price_per_night, amenities)
VALUES
('Maykel Hotel', 1, 'Private Suite', 300.00, 'WiFi, Pool, Gym, room service'),
('Canyela Barcelona', 2, 'Private Room', 190.00, 'WiFi, Pool, Gym'),
('Mystic Coconut Suites', 3, 'Private Villa', 690.00, 'Beach Access, Private Pool, Rental Car'),
('Cristiano Villa', 4, 'Private Villa', 549.00, 'Private Pool, Beach Access, WiFi');

INSERT INTO services (service_name, price, agency_id)
VALUES
('Extra Luggage', 55.00, 1),
('Tour Guides', 150.00, 2),
('Rental Vehicule', 55.00, 3);
\\Insert later
INSERT INTO bookings (customer_id, flight_id, accomodation_id, transfer_id, booking_date, total_price, status)
VALUES
(1, 1, 1, 1, '2024-09-14', 600.00, 'Confirmed'),
(2, 2, 2, 2, '2024-10-08', 400.00, 'Confirmed'),
(3, 3, 3, 3, '2024-09-16', 1900.00, 'Confirmed'),
(4, 4, 4, 4, '2024-12-12', 2900.00, 'Confirmed');

INSERT INTO bookingservices (booking_id, service_id)
VALUES
(9, 1),
(10, 2),
(11, 3);

INSERT INTO payments (booking_id, payment_type, amount, payment_date)
VALUES
(9, 'Bank Transfer', 600.00, '2024-09-14'),
(10, 'Credit Card', 400.00, '2024-10-08'),
(11, 'Bank Transfer', 1500.00, '2024-09-16'),
(12, 'Bank Transfer', 1500.00, '2024-12-12');

INSERT INTO feedback (booking_id, review, comments)
VALUES
(9, 5, 'Amazing Service!'),
(10, 4, 'Great experience, but there was flight delay.'),
(11, 1, 'Bad service!'),
(1, 5, 'Wonderful service, Assistance with everything.');

INSERT INTO agencies (agency_name, agency_email, agency_phone_no, agency_address, established_date ,agency_service)
VALUES
('M Agency', 'm@gmail.com', '1234675', 'Abuja', '2020-01-01', 'BFlights'),
('B  Agency', 'b@gmail.com', '4327546', 'Lagos', '2019-05-15', 'BHotels'),
('C Agency', 'c@gmail.com', '6666438', 'Kano', '2018-07-20', 'BPackage'),
('D Agency', 'd@gmail.com', '8886215', 'Port Harcourt', '2021-03-10', 'FPackage');

INSERT INTO holidayType (holiday_type_name, description)
VALUES 
    ('Mumbai', 'Premium package'),
    ('Cotonou', 'Gold package'),
    ('Porto Novo', 'Silver package'),
    ('Togo', 'Premium package');

INSERT INTO promotions (promotion_name, discount_percentage, start_date, end_date, is_loyalty_exclusive)
VALUES 
    ('Mumbai Premium Package Promotion', 100.00, '2025-03-01', '2025-03-31', FALSE),
    ('Cotonou Gold Package Promotion', 250.00, '2025-03-01', '2025-03-31', FALSE),
    ('Porto Novo Silver Package Promotion', 60.00, '2025-03-01', '2025-03-31', FALSE),
    ('Togo Premium Package Promotion', 10.00, '2025-03-01', '2025-03-31', FALSE);

INSERT INTO customerLoyalty (customer_id, points_gotten, points_reedemed)
VALUES
    (1, 2, 12),
    (2, 3, 0),
    (3, 1, 0),
    (4, 2, 0);
    


INSERT INTO taxiTransfers (transfer_id, destination_id, transfer_type)
VALUES
('1', '1', 'Card'),
('2', '2', 'Bank transfer'),
('3', '3', 'Cash'),
('4', '4', 'Card');