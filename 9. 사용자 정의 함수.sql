#CREATE FUNCTION 실행시 "This function has none of DETERMINISTIC, NO SQL, or READS SQL" 오류 해결

show global variables like 'log_bin_trust_function_creators';
 -- 생성할 수 있는 부분이 OFF처리 설정됨
 SET GLOBAL log_bin_trust_function_creators = 1; //ON
#SET GLOBAL log_bin_trust_function_creators = 0; //OFF

# 전체가 하나로 끝나야함 ( 오류발생)
--  CREATE FUNCTION twosum (
-- 	num1 int,
--     num2 int
--  ) RETURN int
--  BEGIN
-- 	DECLARE sum_ int;
--     SET sum_ = num1 + num2;
--     RETURN sum_;
-- END; 

# $$로 구분자

delimiter $$ 
CREATE FUNCTION twosum (
	num1 int,
    num2 int
) returns int
BEGIN
	declare sum_ int;
    set sum_ = num1 + num2;
	RETURN sum_;
END $$ 
delimiter ;


