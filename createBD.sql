CREATE TABLE Patient(
	patientId INT AUTO_INCREMENT PRIMARY KEY,
	patientName VARCHAR(45) Not Null,
	patientSurname VARCHAR(45) Not Null,
  	patientSex VARCHAR(45),
    patientBirthDate DATE 
);

CREATE TABLE Doctor(
	docId INT AUTO_INCREMENT PRIMARY KEY,
	docSurname VARCHAR(45) Not Null,
	docSpecializationn VARCHAR(45) Not Null,
  	docCategory VARCHAR(45) Not Null
);

CREATE TABLE Contacting(
	contactId INT AUTO_INCREMENT PRIMARY KEY,
	docId INT Not Null,
	patientId INT Not Null,
	contactPrice DECIMAL(10) Not Null,
  	contactDate DATETIME Not Null,
	FOREIGN KEY (patientId) REFERENCES Patient(patientId) ON DELETE CASCADE,
  	FOREIGN KEY (docId) REFERENCES Doctor(docId) ON DELETE CASCADE
);