# 과제  1. Financial_Info 테이블과  JOIN을  활용하여 산업  별  평균  세전  이익을  구해보세요.

#세전 이익
SELECT * 
FROM financial_info
WHERE name_ = 'pretax income';

# id_ code로 구분이 달라 mapping 필요 
SELECT c.indcode, avg(a.value_)
FROM financial_info a
	JOIN  stock_mapping b
	ON a.code = b.code
	JOIN  stock_info c
	ON b.id = c.id
WHERE name_ = 'pretax income';

#나눠야함
SELECT c.indcode, avg(a.value_)
FROM financial_info a
	JOIN  stock_mapping b
	ON a.code = b.code
	JOIN  stock_info c
	ON b.id = c.id
WHERE name_ = 'pretax income'
GROUP BY c.indcode;

# indname 기준으로 
SELECT d.indname, avg(a.value_) as '평균세전이익'
FROM financial_info a
	JOIN  stock_mapping b
	ON a.code = b.code
	JOIN  stock_info c
	ON b.id = c.id
	JOIN stock_industry d
    ON d.indcode = c.indcode
WHERE name_ = 'pretax income'
GROUP BY c.indcode
ORDER BY 2; #평균세전이익 기준으로 오름차순

#과제  2. ETF_Info 테이블과  JOIN을  활용하여 Asset_Type 별로  종가의  평균, 최대값, 최소값을  구해보세요.
#
SELECT *
FROM etf_info a
	JOIN stocketf_price b
		ON a.id = b.id;
        
# 필요한것 select
SELECT a.Asset_Type, b.Close_
FROM etf_info a
	JOIN stocketf_price b
		ON a.id = b.id;

# 
SELECT a.Asset_Type, avg(b.Close_) "종가평균", max(b.Close_), min(b.Close_)
FROM etf_info a
	JOIN stocketf_price b
		ON a.id = b.id;
        
        
#
SELECT a.Asset_Type, avg(b.Close_) "종가평균", max(b.Close_) "종가최댓값" , min(b.Close_) "종가최솟값"
FROM etf_info a
	JOIN stocketf_price b
		ON a.id = b.id;