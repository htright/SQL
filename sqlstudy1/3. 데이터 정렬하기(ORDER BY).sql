#내림차순
SELECT *
FROM stock_info
ORDER BY Mkt_Capitalization_USD DESC;

# default 는 오름차순
SELECT *
FROM stock_info
ORDER BY Mkt_Capitalization_USD;

#내림차순, 10개만
SELECT *
FROM stock_info
ORDER BY Mkt_Capitalization_USD DESC
LiMIT 10;

#
SELECT region, id, indcode, ticker, name, Mkt_Capitalization_USD
FROM stock_info
ORDER BY region, Mkt_Capitalization_USD DESC;

# ORDER BY 에 column 명 안쓰고 순서를 써도 됨
SELECT region, id, indcode, ticker, name, Mkt_Capitalization_USD
FROM stock_info
ORDER BY 1, 6 DESC;

