CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(10) NOT NULL,
    customer_gender VARCHAR(30) NOT NULL,
    customer_email VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    loyalty_points INT DEFAULT 0
);


CREATE TABLE customerLoyalty(
    loyalty_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    points_gotten INT DEFAULT 0,
    points_redeemed INT DEFAULT 0
);

CREATE TABLE destinations(
    destination_id SERIAL PRIMARY KEY,
    destination_location VARCHAR (50) NOT NULL,
    continent VARCHAR(100) NOT NULL,
    country VARCHAR(30) NOT NULL
);

CREATE TABLE flights(
    flight_id SERIAL PRIMARY KEY,
    airline VARCHAR(50) NOT NULL,
    takeoff_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    flight_origin VARCHAR(50) NOT NULL,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    seat_class VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE accomodations(
    accomodation_id SERIAL PRIMARY KEY,
    accomodation_name VARCHAR(50) NOT NULL,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    room_type VARCHAR(30) NOT NULL,
    price_per_night NUMERIC(10, 2) NOT NULL,
    amenities TEXT
);

CREATE TABLE taxiTransfers(
    transfer_id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    transfer_type VARCHAR(40) NOT NULL,
    special_requests TEXT
); 

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
); --change to semi colon

CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    flight_id INT REFERENCES flights(flight_id) ON DELETE SET NULL,
    accomodation_id INT REFERENCES accomodations(accomodation_id) ON DELETE SET NULL,
    transfer_id INT REFERENCES taxitransfers(transfer_id) ON DELETE SET NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price NUMERIC(10, 2) NOT NULL,
    status VARCHAR(40) DEFAULT 'pending'
);

CREATE TABLE bookingservices(
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
    PRIMARY KEY (booking_id, service_id)
);

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    payment_type VARCHAR(100) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE feedback(
    feedback_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    review INT CHECK (review BETWEEN 1 AND 5),
    comments TEXT
);

CREATE TABLE promotions(
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL,
    discount_percentage NUMERIC(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_loyalty_exclusive BOOLEAN DEFAULT FALSE
);

CREATE TABLE bookingpromotions(
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    promotion_id INT REFERENCES promotions(promotion_id) ON DELETE CASCADE,
    PRIMARY KEY (booking_id, promotion_id)
);

CREATE TABLE agencies(
    agency_id SERIAL PRIMARY KEY,
    agency_name VARCHAR(50) NOT NULL,
    agency_email VARCHAR(20) NOT NULL,
    agency_phone_no VARCHAR(20) NOT NULL,
    agency_address VARCHAR(50),
    established_date DATE,
    agency_service VARCHAR(100) NOT NULL
);

CREATE TABLE holidayType(
    holiday_type_id SERIAL PRIMARY KEY,
    holiday_type_name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE agencyServices (
    agency_id INT REFERENCES agencies(agency_id) ON DELETE CASCADE,
    service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
    PRIMARY KEY (agency_id, service_id)
);



CREATE ROLE admin_1 PASSWORD 'admin246';
CREATE ROLE agency_2 PASSWORD 'agency246';
CREATE ROLE customer_3 PASSWORD 'customer246';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to admin_1;

GRANT SELECT ON roles TO agency_2;
GRANT SELECT ON customers TO agency_2;
GRANT SELECT ON destinations TO agency_2;
GRANT SELECT ON flights TO agency_2;
GRANT SELECT ON accomodations TO agency_2;
GRANT SELECT ON taxiTransfers TO agency_2;
GRANT SELECT ON services TO agency_2;
GRANT SELECT ON bookings TO agency_2;
GRANT SELECT ON payments TO agency_2;
GRANT SELECT ON feedback TO agency_2;
GRANT SELECT ON promotions TO agency_2;
GRANT SELECT ON agencies TO agency_2;
GRANT SELECT ON agencyServices TO agency_2;
GRANT SELECT ON holidayType TO agency_2;

GRANT INSERT ON customers TO agency_2;
GRANT INSERT ON destinations TO agency_2;
GRANT INSERT ON flights TO agency_2;
GRANT INSERT ON accomodations TO agency_2;
GRANT INSERT ON taxiTransfers TO agency_2;
GRANT INSERT ON services TO agency_2;
GRANT INSERT ON bookings TO agency_2;
GRANT INSERT ON payments TO agency_2;
GRANT INSERT ON feedback TO agency_2;
GRANT INSERT ON promotions TO agency_2;
GRANT INSERT ON agencies TO agency_2;
GRANT INSERT ON agencyServices TO agency_2;
GRANT INSERT ON holidayType TO agency_2;

GRANT UPDATE ON customers TO agency_2;
GRANT UPDATE ON destinations TO agency_2;
GRANT UPDATE ON flights TO agency_2;
GRANT UPDATE ON accomodations TO agency_2;
GRANT UPDATE ON taxiTransfers TO agency_2;
GRANT UPDATE ON services TO agency_2;
GRANT UPDATE ON bookings TO agency_2;
GRANT UPDATE ON payments TO agency_2;
GRANT UPDATE ON feedback TO agency_2;
GRANT UPDATE ON promotions TO agency_2;
GRANT UPDATE ON agencies TO agency_2;
GRANT UPDATE ON agencyServices TO agency_2;
GRANT UPDATE ON holidayType TO agency_2;

GRANT SELECT ON customerLoyalty TO customer_3;
GRANT SELECT ON destinations TO customer_3;
GRANT SELECT ON flights TO customer_3;
GRANT SELECT ON accomodations TO customer_3;
GRANT SELECT ON taxiTransfers TO customer_3;
GRANT SELECT ON services TO customer_3;
GRANT SELECT ON bookings TO customer_3;
GRANT SELECT ON payments TO customer_3;
GRANT SELECT ON feedback TO customer_3;
GRANT SELECT ON promotions TO customer_3;
GRANT SELECT ON agencies TO customer_3;
GRANT SELECT ON agencyServices TO customer_3;
GRANT SELECT ON holidayType TO customer_3;

-- Admin role

ALTER TABLE customers OWNER TO admin_1;
ALTER TABLE customerLoyalty OWNER TO admin_1;
ALTER TABLE destinations OWNER TO admin_1;
ALTER TABLE flights OWNER TO admin_1;
ALTER TABLE accomodations OWNER TO admin_1;
ALTER TABLE taxiTransfers OWNER TO admin_1;
ALTER TABLE services OWNER TO admin_1;
ALTER TABLE bookings OWNER TO admin_1;
ALTER TABLE bookingservices OWNER TO admin_1;
ALTER TABLE payments OWNER TO admin_1;
ALTER TABLE feedback OWNER TO admin_1;
ALTER TABLE promotions OWNER TO admin_1;
ALTER TABLE bookingpromotions OWNER TO admin_1;
ALTER TABLE agencies OWNER TO admin_1;
ALTER TABLE agencyServices OWNER TO admin_1;
ALTER TABLE holidayType OWNER TO admin_1;
ALTER TABLE customer_holiday_types OWNER TO admin_1;


-- Agency role. Done

GRANT SELECT ON customers TO agency_2;
GRANT SELECT ON destinations TO agency_2;
GRANT SELECT ON flights TO agency_2;
GRANT SELECT ON accomodations TO agency_2;
GRANT SELECT ON taxiTransfers TO agency_2;
GRANT SELECT ON services TO agency_2;
GRANT SELECT ON bookings TO agency_2;
GRANT SELECT ON payments TO agency_2;
GRANT SELECT ON feedback TO agency_2;
GRANT SELECT ON promotions TO agency_2;
GRANT SELECT ON agencies TO agency_2;
GRANT SELECT ON agencyServices TO agency_2;
GRANT SELECT ON holidayType TO agency_2;


GRANT INSERT ON customers TO agency_2;
GRANT INSERT ON destinations TO agency_2;
GRANT INSERT ON flights TO agency_2;
GRANT INSERT ON accomodations TO agency_2;
GRANT INSERT ON taxiTransfers TO agency_2;
GRANT INSERT ON services TO agency_2;
GRANT INSERT ON bookings TO agency_2;
GRANT INSERT ON payments TO agency_2;
GRANT INSERT ON feedback TO agency_2;
GRANT INSERT ON promotions TO agency_2;
GRANT INSERT ON agencies TO agency_2;
GRANT INSERT ON agencyServices TO agency_2;
GRANT INSERT ON holidayType TO agency_2;

GRANT USAGE, SELECT ON SEQUENCE customers_customer_id_seq TO agency_2;
GRANT USAGE, SELECT ON SEQUENCE customerLoyalty_loyalty_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE destinations_destination_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE flights_flight_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE accomodations_accomodation_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE taxiTransfers_transfer_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE services_service_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE bookings_booking_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE payments_payment_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE feedback_feedback_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE promotions_promotion_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE agencies_agency_id_seq TO admin_1;
GRANT USAGE, SELECT ON SEQUENCE holidayType_holiday_type_id_seq TO admin_1;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE customer_holiday_types TO agency_2;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE bookingpromotions TO agency_2;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE bookingservices TO agency_2;

-- Customer role. done
ALTER ROLE customer_3 WITH LOGIN;
--how to access in powershell
--psql -U admin_role -d easytravel
--psql -U agency_role -d easytravel
--psql -U customer_role -d easytravel
