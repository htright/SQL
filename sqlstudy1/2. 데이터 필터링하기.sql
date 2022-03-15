SELECT *
FROM Stock_info
WHERE mkt_capitalization_usd > 1000000  #조건 
;

SELECT *
FROM Stock_info
WHERE mkt_capitalization_usd < 4000  #조건 
;

SELECT *
FROM Stock_info
WHERE mkt_capitalization_usd BETWEEN 1000000 AND 2000000; 

SELECT *
FROM Stock_info
WHERE mkt_capitalization_usd BETWEEN 3500 AND 4000; 


# 조건 AND
SELECT *
FROM stock_info
WHERE region = 'KR' 
	AND
	mkt_capitalization_usd < 5000;  
    
# 조건 or
SELECT *
FROM stock_info
WHERE region = 'US' 
	or
	mkt_capitalization_usd < 4000;  


SELECT *
FROM stock_info
WHERE region = 'US' 
	or
	region = 'KR'
    or
    region = 'CN' ;  
    
# or을 여러개 넣기 (위와 동일한 데이터 추출됨)
SELECT *
FROM stock_info
WHERE region IN ('kr', 'us', 'cn');

# or을 여러개 넣기 (not) (위와 동일한 데이터 추출됨)
SELECT *
FROM stock_info
WHERE region NOT IN ('kr', 'us', 'cn');

# full name 다 모를때 자료를 못 찾음
SELECT *
FROM stock_info
WHERE NAME = 'softbank';

#패턴이용한 검색
SELECT *
FROM stock_info
WHERE NAME LIKE '%softbank%';

#A로 시작하는 모든 데이터 불러오기
SELECT *
FROM stock_info
WHERE NAME LIKE 'A%';

#A로 끝나는 데이터
SELECT *
FROM stock_info
WHERE NAME LIKE '%A';

#SAMSUNG이 포함된 모든 데이터
SELECT *
FROM stock_info
WHERE NAME LIKE '%SAMSUNG%';

#_m 두번째 글자가 'm'인 모든 데이터
SELECT *
FROM stock_info
WHERE NAME LIKE '_m%';

# a로 시작하고 글자수가 3개 이상
SELECT *
FROM stock_info
WHERE NAME LIKE 'A_%_%';

#W로 시작하고 D로 끝나는 data
SELECT *
FROM stock_info
WHERE NAME LIKE 'W%D';

# E로 시작하는게 뭐였더라?
SELECT *
FROM etf_info
WHERE asset_type LIKE 'E%';


