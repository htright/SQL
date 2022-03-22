-- 단일 값
SELECT max(marketdate)
FROM stocketf_price;

SELECT AVG(close_)
FROM stocketf_price;

-- 단일 열 테이블
SELECT id
FROM stock_info
WHERE region = 'KR';

-- 다중 열 테이블
SELECT *
FROM stock_info
WHERE region = 'KR';

-- 다중 열 테이블 활용
# 기본
SELECT *, RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
FROM stock_info;

# 하나의 쿼리를 활용하여 가져온 것
SELECT *
FROM
(
SELECT *, RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
FROM stock_info
) b;

# 쿼리를 하나의 테이블처럼 활용 (다중열 테이블 활용) -> WHERE 적용 
SELECT *
FROM
(
SELECT *, RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
FROM stock_info
) b
WHERE 시가총액순위 <=3;

-- 단일 열 & 단일 값 테이블 활용
# 단일 열
SELECT id
FROM stock_info
WHERE region = 'kr';

# 
SELECT a.*, b.region
FROM stocketf_price a
	JOIN stock_info b
	ON a.id = b.id
WHERE a.id in  #필터로 id가 kr이 포함된 것 가져오기
	(SELECT id
	FROM stock_info
	WHERE region = 'kr');

# 단일 값
SELECT *
FROM stocketf_price
WHERE MarketDate IN  # WHERE MarketDate '=' 보다 'IN'을 사용하면 실수할 확률 줄어듬
	(SELECT max(marketdate) # 가장 최근 값 가져오기 ( 매일 바뀌는 데이터를 사용해도 최신의 데이터를 추출할 수 있음)
    FROM stocketf_price);
    
-- 임시테이블(VIEW & WITH) : 휘발성이 있는 기능 

# Query 저장
CREATE VIEW MaxDate_Price
AS
SELECT *
FROM stocketf_price
WHERE MarketDate IN  # WHERE MarketDate '=' 보다 'IN'을 사용하면 실수할 확률 줄어듬
	(SELECT max(marketdate) # 가장 최근 값 가져오기 ( 매일 바뀌는 데이터를 사용해도 최신의 데이터를 추출할 수 있음)
    FROM stocketf_price);

# 불러오기
SELECT *
FROM maxdate_price; 

# Query 저장2
CREATE VIEW Rank_Stock
AS
SELECT *, 
	RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
FROM stock_info;


# Query 불러오기 2
SELECT *
FROM rank_stock
WHERE 시가총액순위 <= 3;

# VIEW 지우기
DROP VIEW maxdate_price;

# WITH
WITH temp_rank AS(
	SELECT *, 
		RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
	FROM stock_info
)
SELECT *
FROM temp_rank;

# WITH
WITH temp_rank AS(
	SELECT *, 
		RANK() OVER(PARTITION BY region ORDER BY Mkt_Capitalization_USD DESC) "시가총액순위"
	FROM stock_info
)
SELECT *
FROM temp_rank
WHERE 시가총액순위 <= 3;

