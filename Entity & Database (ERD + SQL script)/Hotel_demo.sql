-- Hotel_demo.sql
DROP DATABASE IF EXISTS hotel_demo;
CREATE DATABASE IF NOT EXISTS hotel_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE hotel_demo;

-- rooms/accounts etc (schema)
CREATE TABLE IF NOT EXISTS room_types (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  capacity INT,
  description TEXT
);

CREATE TABLE IF NOT EXISTS rooms (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  type_id INT,
  room_no VARCHAR(20) UNIQUE,
  status ENUM('AVAILABLE','OCCUPIED','MAINTENANCE') DEFAULT 'AVAILABLE',
  floor INT,
  FOREIGN KEY (type_id) REFERENCES room_types(type_id)
);

CREATE TABLE IF NOT EXISTS guests (
  guest_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  phone VARCHAR(50),
  email VARCHAR(150),
  address TEXT
);

CREATE TABLE IF NOT EXISTS staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  role VARCHAR(50),
  username VARCHAR(100),
  password_hash VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS reservations (
  resv_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT,
  room_id INT NULL,
  checkin_date DATE,
  checkout_date DATE,
  status ENUM('HOLD','RESERVED','CONFIRMED','CHECKED_IN','COMPLETED','CANCELLED') DEFAULT 'HOLD',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE IF NOT EXISTS payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  resv_id INT,
  amount DECIMAL(10,2),
  method VARCHAR(50),
  status ENUM('PENDING','SUCCESS','FAILED') DEFAULT 'PENDING',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (resv_id) REFERENCES reservations(resv_id)
);

-- sample data
INSERT INTO room_types (name, price, capacity, description) VALUES
('Standard', 30.00, 2, 'Standard room'),
('Deluxe', 50.00, 3, 'Deluxe room');

INSERT INTO rooms (type_id, room_no, status, floor) VALUES
(1,'101','AVAILABLE',1),
(1,'102','AVAILABLE',1),
(2,'201','AVAILABLE',2);

INSERT INTO guests (name, phone, email, address) VALUES
('Nguyen Van A', '0912345678', 'a@example.com', 'Hanoi'),
('Tran Thi B', '0987654321', 'b@example.com', 'HCMC');

-- sample reservation
INSERT INTO reservations (guest_id, room_id, checkin_date, checkout_date, status)
VALUES (1, 1, '2025-10-10', '2025-10-12', 'CONFIRMED');

INSERT INTO payments (resv_id, amount, method, status) VALUES (1, 60.00, 'CARD', 'SUCCESS');
