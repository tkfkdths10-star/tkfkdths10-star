# 데이터베이스 만들기
 CREATE DATABASE pethotel;
# 데이터베이스 실행
 USE pethotel;

# 테이블 생성
# 반려동물 주인 테이블
 CREATE TABLE petOwners(
 	ownerID INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(20),
     contact VARCHAR(50)
 );

# 반려동물 테이블
 CREATE TABLE pets(
 	petID INT PRIMARY KEY AUTO_INCREMENT,
     ownerID INT NOT NULL,
     name VARCHAR(20) NOT NULL,
     species VARCHAR(50) NOT NULL,
     breed VARCHAR(50) NOT NULL,
     FOREIGN KEY(ownerID) REFERENCES petOwners(ownerID)
 );

# 객실 테이블
  CREATE TABLE Rooms(
  	roomID INT PRIMARY KEY AUTO_INCREMENT,
      roomNumber VARCHAR(50) NOT NULL UNIQUE,
      roomType ENUM('Sapphire', 'Topaz', 'Ruby', 'Diamond'),
      pricePerNight DECIMAL(10,2) NOT NULL
  );

# 예약 테이블
 CREATE TABLE Reservations(
 	reservationID INT PRIMARY KEY AUTO_INCREMENT,
     petID INT NOT NULL,
     roomID INT NOT NULL,
     startDate DATE NOT NULL,
     endDate DATE NOT NULL,
     FOREIGN KEY(petID) REFERENCES Pets(petID),
     FOREIGN KEY(roomID) REFERENCES Rooms(roomID)
 );

# 서비스 테이블
  CREATE TABLE Services(
  	serviceID INT PRIMARY KEY AUTO_INCREMENT,
      reservationID INT NOT NULL,
      serviceName VARCHAR(50),
      servicePrice DECIMAL(10,2),
      FOREIGN KEY(reservationID) REFERENCES Reservations(reservationID)
  );