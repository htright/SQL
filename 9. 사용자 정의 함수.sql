#Table 생성
CREATE TABLE Person(
	ID int,
    Name text,
    Age int
);

#Table 삭제
Drop table Person;

ALTER TABLE Person2
RENAME TO Person;

# Column 추가
ALTER TABLE person
ADD COLUMN Region text;

# Column name 변경
ALTER TABLE Person
CHANGE COLUMN region city text;

# column 삭제
ALTER TABLE person
DROP COLUMN city;

# column 추가
ALTER TABLE person
ADD COLUMN city text;

-- 컬럼 데이터 추가
#
INSERT INTO person
	(ID, NAME, AGE, CITY)
    VALUES(1, 'Hyuntae', 29, 'Incheon');

#
INSERT INTO person
	(ID, NAME)
	VALUE(2, 'Heesoo');

#
INSERT INTO person
	(ID, NAME, AGE, CITY)
	VALUE(3, 'Bill', 33, 'Seoul'),
		(4, 'Tom', 31, 'Seoul');

#
INSERT INTO person
	VALUES(5, 'Brad', 32, 'Dokdo');

SELECT *
FROM person;

-- 
# 전체 삭제
DELETE FROM person;

#
DELETE FROM person
WHERE AGE is null;

# AGE 31이 아닌 값 제거
DELETE FROM person
WHERE AGE <> 31;

SELECT *
FROM person;

--
#
INSERT INTO PERSON
	VALUES(1, 'AB', 33, 'KR'),
		(2, 'BC', 33, 'KR'),
        (3, 'ND', 36, 'US'),
        (4, 'ME', 31, 'US');

# 
UPDATE person
SET CITY = 'SEOUL'
WHERE CITY = 'KR';

SELECT *
FROM person;

-- 테이블 핸들링(제약조건)
CREATE TABLE person(
	ID INT auto_increment primary key,
    NAME text NOT NULL,
    Age int not null
);

# ID 안적어도됨 (제약조건했으니)
INSERT INTO person
	(NAME, AGE)
    VALUES('c', 31);

SELECT *
FROM person;

