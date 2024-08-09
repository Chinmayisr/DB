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
>db.createCollection("warehouse1")
>db.warehouse1.insertOne({"P_ID":1947,"P_Name":'bolts',"Colour":'black',"S_No":1234,"S_Name":'
ABC',"Address":'bangaluru'})
>db.warehouse1.insertOne({"P_ID":2867,"P_Name":'nuts',"Colour":'grey',"S_No":5678,"S_Name":'X
YZ',"Address":'davangere'})
>db.warehouse1.insertOne({"P_ID":9462,"P_Name":'screw',"Colour":'green',"S_No":6320,"S_Name"
:'LKF',"Address":'hubli'})
>db.warehouse1.updateOne({"P_ID":1947}, {$set: {"P_ID":8888}})
>db.warehouse1.find().pretty()
>db.warehouse1.find({"P_ID":9462}).pretty()

    

create table SHIPMENT (PartNumber number, partName varchar(20));

insert into SHIPMENT values (101, 'wheel'); insert into SHIPMENT values (102, 'tyre');

insert into SHIPMENT values (103, 'tube');

create table SHIPMENT_PART (PartNumber number, partName varchar(20));

SET SERVEROUTPUT ON;

DECLARE

Define the part number to filter by v_part_number SHIPMENT. PartNumber%TYPE := 101;

BEGIN

Insert rows into SHIPMENT_PART from SHIPMENT where PartNumber matches v part_number

INSERT INTO SHIPMENT_PART SELECT * FROM SHIPMENT WHERE Part Number = v_part_number;

Display the number of rows copied

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || rows copied to SHIPMENT_PART table for PartNumber: ' || v_part_number);

EXCEPTION

WHEN OTHERS THEN

Handle exceptions

DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);

END;

/

SELECT * from SHIPMENT_PART;
