#과제  1. ETF_Info 테이블에서  Asset_Type과  Name을  기준으로 정렬한  값을  조회해보세요
SELECT *
FROM etf_info
ORDER BY Asset_Type, name;

SELECT *
FROM etf_info
ORDER BY 5, 3;

#
SELECT id, ticker, name, currency, asset_type, geo_focus
FROM etf_info
ORDER BY 5, 3;



#과제  2. Financial_Info 테이블에서  Retained_Earnings 값을  기준으로 상위  10개의  데이터만  조회해보세요.
/* SELECT *
FROM financial_info
WHERE Name_ LIKE "%retained_Earnings%";

SELECT *
FROM financial_info
WHERE Name_ LIKE "Retained_earnings"
ORDER BY value_ DESC
LIMIT10; */

SELECT *
FROM financial_info
WHERE NAME_ = 'retained earnings'
ORDER BY VALUE_ DESC
LIMIT 10;

