SELECT *,
	RANK() OVER(ORDER BY mkt_capitalization_usd) 순위
FROM stock_info;

# 시가총액을 내림차순한 후 순위 매기기
SELECT *,
	RANK() OVER(ORDER BY mkt_capitalization_usd DESC) 순위
FROM stock_info;

# 중복순위 적용 후 순위
SELECT indcode,
	RANK() OVER(ORDER BY indcode DESC) 순위
FROM stock_info;

# 중복순위, 중복 순위 적용+1
SELECT indcode,
	DENSE_RANK() OVER(ORDER BY indcode DESC) 순위
FROM stock_info;

# region별로 순서를 쭉 나열 후 순위
SELECT *,
	RANK() OVER(PARTITION BY region ORDER BY mkt_capitalization_usd DESC) 순위
FROM stock_info;

# 원본
SELECT id, marketdate, close_
FROM stocketf_price
ORDER BY id, marketdate;

# 이동 함수 (이전 값 가져오기)
SELECT id, marketdate, close_,
	LAG(close_, 1) OVER(ORDER BY marketdate) 어제값
FROM stocketf_price
ORDER BY id, marketdate;

# 어제값 가져오기
SELECT id, marketdate, close_,
	LAG(close_, 1) OVER(PARTITION BY id ORDER BY marketdate) 어제값 # id로 우선 파티션 나누고 marketdate로 오름차순으로 가져옴
FROM stocketf_price
ORDER BY id, marketdate;


# 5일전값 가져오기
SELECT id, marketdate, close_,
	LAG(close_, 5) OVER(PARTITION BY id ORDER BY marketdate) 5일전값 # id로 우선 파티션 나누고 marketdate로 오름차순으로 가져옴
FROM stocketf_price
ORDER BY id, marketdate;

# partion by 를 안 넣어서 63과 같은 값이 나옴 
SELECT id, marketdate, close_,
	AVG(CLOSE_) OVER (ORDER BY marketdate
					ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) 이동평균5일
FROM stocketf_price
ORDER BY id, marketdate;

#
SELECT id, marketdate, close_,
	AVG(CLOSE_) OVER (PARTITION BY id ORDER BY marketdate
					ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) 이동평균5일
FROM stocketf_price
ORDER BY id, marketdate;

#
SELECT id, marketdate, close_,
	AVG(CLOSE_) OVER (PARTITION BY id ORDER BY marketdate
					ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) 이동평균5일,
	AVG(CLOSE_) OVER (PARTITION BY id ORDER BY marketdate
					ROWS BETWEEN 19 PRECEDING AND CURRENT ROW) 이동평균20일                    
FROM stocketf_price
ORDER BY id, marketdate;


#
SELECT id, marketdate, close_,
	AVG(CLOSE_) OVER (PARTITION BY id ORDER BY marketdate
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 누적총계
FROM stocketf_price
ORDER BY id, marketdate;