SELECT REGION, INDCODE, TICKER, NAME, MKT_CAPITALIZATION_USD
FROM STOCK_INFO;


SELECT *
FROM stock_info;

SELECT DISTINCT region   #중복제거
FROM stock_info;
        
SELECT DISTINCT region, indcode #중복제거해서 필요한 데이터 확인
FROM stock_info;

SELECT *
FROM stock_info;

SELECT region AS 지역, MKT_CAPITALIZATION_USD AS 시가총액
FROM stock_info;

SELECT region 지역, MKT_CAPITALIZATION_USD "시가총액 USD"     # as 안쓰는 방법 & 공백마저 인식하고 싶을때 "" 사용할 것
FROM stock_info;

SELECT *
FROM stock_info
LIMIT 10; # 결과 행 개수 제한하여 조회