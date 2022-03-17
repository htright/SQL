#CASE WHEN
SELECT *, 
	CASE WHEN mkt_capitalization_usd > 1000000 THEN 'BIG'
    ELSE 'SMALL'
    END AS 그룹
FROM stock_info
ORDER BY mkt_capitalization_usd DESC;

SELECT *, 
	CASE WHEN mkt_capitalization_usd > 1000000 THEN 'BIG'
	WHEN mkt_capitalization_usd > 500000 THEN 'MIDDLE'
    ELSE 'SMALL'
    END AS 그룹
FROM stock_info
ORDER BY mkt_capitalization_usd DESC;

# 집계 함수
SELECT SUM(mkt_capitalization_usd) TOTAL시가총액,
		COUNT(mkt_capitalization_usd) COUNT시가총액,
        MIN(mkt_capitalization_usd) MIN시가총액,
        MAX(mkt_capitalization_usd) MAX시가총액,
        AVG(mkt_capitalization_usd) AVG시가총액
FROM stock_info;

#숫자 함수
-- TRUNCATE( ,n) 소수점 n자리 까지 표시
SELECT TRUNCATE(10.123124, 3);

-- ROUND( ,n) 소수점 자리 지정하여 반올림
SELECT ROUND(10.123356, 3);

-- 올림
SELECT CEIL(10.12345);

-- 내림
SELECT FLOOR(10.21313);

-- 절대값으로 변환
SELECT ABS( -100);

-- 양수면 1, 음수면 -1, 0이면 0
SELECT SIGN(-12345), SIGN(1234);


#문자 함수
-- LENGTH() 문자열 길이 반환

-- TRIM() 앞, 뒤 공백 제거

-- UPPER(), LOWER() 모두 대문자 / 소문자로

-- LEFT( ,n) 왼쪽에서 n번째까지

-- RIGHT( ,n) 오른쪽에서 n번째까지

-- REPLACE() 특정 패턴 찾아서 변경
SELECT REPLACE(name, 'limited', 'LTD') # 대소문자 결과가 다르네?
FROM stock_info;

SELECT REPLACE(name, 'LIMITED', 'LTD')
FROM stock_info;

-- LPAD(), RPAD() 특정 글자 반복
SELECT id
FROM stock_info;

SELECT id, LPAD(id, 6, 0) # 모두 다 6자리 숫자로 만들기 위해서
FROM stock_info;

-- SUBSTRING() 특정 위치에서 자르기
SELECT SUBSTRING('2020-10-10', 1, 4), #연 데이터
		SUBSTRING('2020-10-10', 6, 2), #월 데이터
        SUBSTRING('2020-10-10', 9, 2); #일 데이터;

SELECT SUBSTRING('2020-10-15', 1, 4) YEAR, #연 데이터
		SUBSTRING('2020-10-15', 6, 2) MONTH, #월 데이터
        SUBSTRING('2020-10-15', 9, 2) DAY; #일 데이터

-- CONCAT() 문자 붙이기
SELECT CONCAT(name, '의 티커는', TICKER)
FROM stock_info;

-- CONCAT_WS() 문자 사이에 값 넣기
SELECT CONCAT_WS('//////', id, name, ticker)
FROM stock_info;

#날짜, 시간 함수

SELECT CURDATE()
		,CURTIME()
        ,NOW()
        ,YEAR(NOW());
-- CURDATE()

-- CURTIME()

-- NOW()

SELECT
	marketdate,
    YEAR(marketdate),
    MONTH(marketdate),
    DAY(marketdate),
    LAST_DAY(marketdate)
FROM stocketf_price;

-- YEAR()

-- MONTH()

-- DAY()

-- LAST_DAY()

-- WEEKDAY()

-- DAYNAME()
SELECT
	marketdate,
	ADDDATE(marketdate, 3),
    LAST_DAY(marketdate),
    ADDDATE(LAST_DAY(marketdate), 1),
    DATEDIFF(marketdate, LAST_DAY(marketdate))
FROM stocketf_price;
-- ADDDATE()

-- SUBDATE()

-- DATEDIFF()

-- TIMEDIFF()

# 데이터 포맷팅
SELECT marketdate, DATE_FORMAT(marketdate, '%Y/%m')
FROM stocketf_price
ORDER BY marketdate;

-- %Y

-- %y 

-- %M

-- %b

-- %W

-- %a

-- %i

-- %T

-- %m

-- %c

-- %d

-- %e

-- %I

-- %H

-- %r

-- %S