# SQL 기초 

## 0. 데이터베이스 용어

## 1. 데이터 불러오기

## 2. 데이터 필터링하기

## 3. 데이터 정렬하기

## 4. 여러가지 함수

## 5. 데이터 그룹화

## 6. 데이터 분할분석

## 7. 테이블 합치기

## 8. 서브 쿼리

## 9. 사용자 정의 함수

## 10. 테이블&데이터 핸들링


# 오류해결

## CREATE FUNCTION 실행시 "This function has none of DETERMINISTIC, NO SQL, or READS SQL" 오류 

show global variables like 'log_bin_trust_function_creators';
 <body>생성할 수 있는 부분이 OFF처리 설정됨
 SET GLOBAL log_bin_trust_function_creators = 1; //ON
#SET GLOBAL log_bin_trust_function_creators = 0; //OFF </body>