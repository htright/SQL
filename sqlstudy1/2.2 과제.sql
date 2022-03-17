#과제  1. Financial_Info 테이블에서
-- Total_Assets의  값이  10,000,000 이상인  값만  조회해보세요.
SELECT *
FROM financial_info
WHERE name_ = 'Total Assets'       # " '' " 까먹지 말 것
	AND
    value_ > 10000000;


#과제  2. Fiancial_Info 테이블에서  Income과  관련된  항목  중
-- 값이  5,000 ~ 10,000 사이인  데이터를  조회해보세요.
SELECT *
FROM financial_info
WHERE name_ LIKE  "%income%"
	AND
    value_ BETWEEN 5000 AND 10000;