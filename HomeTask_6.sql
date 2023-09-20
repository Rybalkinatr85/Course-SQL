DROP DATABASE IF EXISTS travel;
CREATE DATABASE travel;
USE travel;
CREATE TABLE manufacturers (
  manufacturer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  manufacturer VARCHAR(50) NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_update TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (manufacturer_id) ) 
ENGINE=InnoDB AUTO_INCREMENT=1001;
CREATE TABLE airplanes (
  plane_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  plane VARCHAR(50) NOT NULL,
  manufacturer_id INT UNSIGNED NOT NULL,
  engine_type VARCHAR(50) NOT NULL,
  engine_count TINYINT NOT NULL,
  max_weight MEDIUMINT UNSIGNED NOT NULL,
  wingspan DECIMAL(5,2) NOT NULL,
  plane_length DECIMAL(5,2) NOT NULL,
  parking_area INT GENERATED ALWAYS AS 
              ((wingspan * plane_length)) STORED,
  icao_code CHAR(4) NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_update TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (plane_id),
  CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id) 
    REFERENCES manufacturers (manufacturer_id) ) 
ENGINE=InnoDB AUTO_INCREMENT=101;

INSERT INTO manufacturers (manufacturer)
VALUES ('Airbus'), ('Beechcraft'), ('Piper');
INSERT INTO airplanes 
  (plane, manufacturer_id, engine_type, engine_count, 
    max_weight, wingspan, plane_length, icao_code)
VALUES 
  ('A380-800', 1001, 'jet', 4, 1267658, 261.65, 238.62, 'A388'),
  ('A319neo Sharklet', 1001, 'jet', 2, 166449, 117.45, 111.02, 'A319'),
  ('ACJ320neo (Corporate Jet version)', 1001, 'jet', 2, 174165, 117.45, 123.27, 'A320'),
  ('A300-200 (A300-C4-200, F4-200)', 1001, 'jet', 2, 363760, 147.08, 175.50, 'A30B'),
  ('Beech 390 Premier I, IA, II (Raytheon Premier I)', 1002, 'jet', 2, 12500, 44.50, 46.00, 'PRM1'),
  ('Beechjet 400 (from/same as MU-300-10 Diamond II)', 1002, 'jet', 2, 15780, 43.50, 48.42, 'BE40'),
  ('1900D', 1002, 'Turboprop', 2,17120,  57.75, 57.67, 'B190'),
  ('PA-24-400 Comanche', 1003, 'piston', 1, 3600, 36.00, 24.79, 'PA24'),
  ('PA-46-600TP Malibu Meridian, M600', 1003, 'Turboprop', 1, 6000, 43.17, 29.60, 'P46T'),
  ('J-3 Cub', 1003, 'piston', 1, 1220, 38.00, 22.42, 'J3');
  
  select * from manufacturers;
  
  select * from airplanes;