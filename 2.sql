CREATE TABLE Supplier (
    SID NUMBER PRIMARY KEY,
    SNAME VARCHAR2(50),
    SADDR VARCHAR2(100)
);

CREATE TABLE Part (
    PID NUMBER PRIMARY KEY,
    PNAME VARCHAR2(50),
    PCOLOR VARCHAR2(20)
);

CREATE TABLE Shipment (
    ShipmentID NUMBER PRIMARY KEY,
    SID NUMBER,
    PID NUMBER,
    Quantity NUMBER,
    FOREIGN KEY (SID) REFERENCES Supplier(SID) ON DELETE CASCADE,
    FOREIGN KEY (PID) REFERENCES Part(PID) ON DELETE CASCADE
);

INSERT INTO Supplier VALUES (1, 'Supplier A', '123 Main St');
INSERT INTO Supplier VALUES (2, 'Supplier B', '456 Elm St');

INSERT INTO Part VALUES (101, 'Part X', 'Red');
INSERT INTO Part VALUES (102, 'Part Y', 'Blue');

INSERT INTO Shipment VALUES (1001, 1, 101, 50);
INSERT INTO Shipment VALUES (1002, 2, 102, 30);

1.Obtain the details of parts supplied by supplier #SNAME.
SELECT p.*
FROM Part p
JOIN Shipment s ON p.PID = s.PID
JOIN Supplier sup ON s.SID = sup.SID
WHERE sup.SNAME = 'Supplier A';

2.Obtain the Names of suppliers who supply #PNAME.
SELECT sup.SNAME
FROM Supplier sup
JOIN Shipment s ON sup.SID = s.SID
JOIN Part p ON s.PID = p.PID
WHERE p.PNAME = 'Part X';

3.Delete the parts which are in #PCOLOR.
DELETE FROM Part
WHERE PCOLOR = :PCOLOR;

#Mongo DB

