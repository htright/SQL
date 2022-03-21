#
SELECT *
FROM stock_info;

# indname
SELECT *
FROM stock_industry;

# stock_industry의 indname을 JOIN
SELECT *
FROM stock_info JOIN stock_industry;

# 2314가 무엇인지 일일히 확인해야했음
SELECT *
FROM stock_industry
WHERE indcode = 2314;

#
SELECT *
FROM stock_info JOIN stock_industry
ON stock_info.indcode = stock_industry.indcode;

#
SELECT stock_info.id, stock_info.indcode, stock_info.name, stock_industry.indname
FROM stock_info JOIN stock_industry
ON stock_info.indcode = stock_industry.indcode;

# AS로 오타방지 
SELECT a.id, a.indcode, a.name, b.indname
FROM stock_info AS a JOIN stock_industry AS b
ON a.indcode = b.indcode;

-- LEFT JOIN

# 빈 곳은 NULL
SELECT *
FROM stock_industry a LEFT JOIN stock_info b
ON a.indcode = b.indcode
ORDER BY id;

#
SELECT *
FROM stock_info b RIGHT JOIN stock_industry a
ON a.indcode = b.indcode
ORDER BY id;

# CROSS JOIN 모든 경우의 수를 확인
SELECT *
FROM stock_industry CROSS JOIN stock_info;

-- 

# code로 구분됨
SELECT *
FROM financial_info;

# id로 구분됨
SELECT * 
FROM stock_info;

-- Mapping table

# code로 구분됨
SELECT *
FROM financial_info
WHERE code = 40853;

# id로 구분됨
SELECT *
FROM stock_info
WHERE name LIKE '%SAMSUNG ELE%';

# mapping
SELECT *
FROM financial_info a JOIN stock_mapping b
ON a.code = b.code;

# 필요한 값만 불러오기
SELECT a.name_, a.fiscalprd_, a.value_
FROM financial_info a JOIN stock_mapping b
ON a.code = b.code;


SELECT a.name_, a.fiscalprd_, a.value_, c.name
FROM financial_info a 
JOIN stock_mapping b
	ON a.code = b.code
JOIN stock_info c
	ON c.id = b.id;


WHERE code = 40853;


SELECT *
FROM stock_mapping