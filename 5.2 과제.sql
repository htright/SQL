# 과제  1. Financial_Info 테이블에서  각  연도별  Operating_Income의 최소값, 최대값, 평균값을  구해보세요.
-- 연도별 table 확인
SELECT *
FROM financial_info;

/* X
SELECT MIN(operating_income),
	MAX(operating_income),
    AVG(operating_income)
FROM financial_info;
GROUP BY fiscalprd_;*/

#operating income 필터 걸어진거 check
SELECT *
FROM financial_info
WHERE name_ = 'operating income'
GROUP BY fiscalprd_;

#정답
SELECT fiscalprd_,
	MIN(value_),
    MAX(value_),
    AVG(value_)
FROM financial_info
WHERE name_ = 'operating income'
GROUP BY fiscalprd_;


# 과제  2. Stock_Info 테이블에서  각  IndCode별  시가총액  평균을  구하고 시가총액  평균값이  100,000 이상인  데이터만  조회해보세요.
SELECT *
FROM stock_info
GROUP BY indcode;

#group by 안해서 indcode 별 정렬 안되었음
SELECT indcode,
	avg(mkt_capitalization_usd)
FROM stock_info
HAVING AVG(Mkt_Capitalization_USD) >= 100000;


#정답
SELECT indcode,
	avg(mkt_capitalization_usd)
FROM stock_info
GROUP BY indcode
HAVING AVG(Mkt_Capitalization_USD) >= 100000
ORDER BY AVG(Mkt_Capitalization_USD) DESC;  #내림차순 정렬