# 과제  1. Financial_Info 테이블에서  각  연도별 총자산  순위를  구해보세요.(내림차순)

-- 일단 전체 data check
select *
FROM financial_info;

-- 총자산만 뽑기
SELECT *,
		RANK() OVER(PARTITION BY fiscalprd_ ORDER BY value_ DESC) 순위
FROM financial_info
WHERE name_ = 'total assets';

-- 내가 푼 것인데 WHERE name_ = 'total assets'; 은 어디서 나온거지?
SELECT *,
	RANK() OVER(PARTITION BY fiscalprd_ ORDER BY value_ DESC) 순위
FROM financtial_info;



# 과제  2. StockETF_Price 테이블에서  삼성전자의 5일  /20일  이동평균  값을  구해보세요
-- data 확인
SELECT *
FROM stocketf_price;

-- 삼성전자 확인
SELECT *
FROM stock_info
WHERE name like '%SAMSUNG ELEC%';

-- 삼전 티커 가져온 것 조건 넣고 추출 # 하나여서 partition 안해도됨  
SELECT id, marketdate, close_,
	AVG(close_) OVER(ORDER BY marketdate  
					ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) MA5,
	AVG(close_) OVER(ORDER BY marketdate  
					ROWS BETWEEN 19 PRECEDING AND CURRENT ROW) MA20                    
FROM stocketf_price
WHERE id = 40853;


# 과제  3. Financial_Info 테이블에서  각  기업별로  전년도  대비 Pretax_Income 증감률을  확인해보세요.
# 증감률 = (이번 금액 - 이전 금액) / abs(이전 금액)

-- data check
SELECT *
FROM financial_info;

-- pretax income만 뽑기
SELECT *
FROM financial_info
WHERE name_ = 'pretax income';

-- 각 기업의 전년도 데이터 뽑기
SELECT *,
	# 전년도 data가져오기
    LAG(value_, 1) OVER(PARTITION BY code ORDER BY fiscalprd_)
FROM financial_info
WHERE name_ = 'pretax income'
ORDER BY code, fiscalprd_;  

-- 증감률 
SELECT *,
    LAG(value_, 1) OVER(PARTITION BY code ORDER BY fiscalprd_),
    (value_ - LAG(value_, 1) OVER(PARTITION BY code ORDER BY fiscalprd_)) / ABS(LAG(value_, 1) OVER(PARTITION BY code ORDER BY fiscalprd_)) 증감률
FROM financial_info
WHERE name_ = 'pretax income'
ORDER BY code, fiscalprd_;  




-- 
SELECT code, fiscalprd_, pretax_income,
	AVG(pretax_income) OVER (ORDER BY pretax_income
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 누적총계
FROM financial_info

ORDER BY code, pretax;