-- 재구매가 일어난 상품과 회원 리스트 구하기 

/*문제 설명
다음은 어느 의류 쇼핑몰의 온라인 상품 판매 정보를 담은 ONLINE_SALE 테이블 입니다. 
ONLINE_SALE 테이블은 아래와 같은 구조로 되어있으며 
ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE는 
각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.*/

/*문제
ONLINE_SALE 테이블에서 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 
재구매한 회원 ID와 재구매한 상품 ID를 출력하는 SQL문을 작성해주세요. 
결과는 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 내림차순 정렬해주세요.*/

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE 
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID, PRODUCT_ID DESC;

/*HAVING 절은 GROUP BY로 묶은 그룹에 대해 조건을 지정하기 위해 사용한다.
이 문제에서는 USER_ID와 PRODUCT_ID별로 그룹을 만든 후, 동일한 상품을 2번 이상 구매한 경우만 조회해야 한다. 
구매 횟수인 COUNT(*)는 집계 함수이므로 WHERE 절에서는 사용할 수 없고, 
집계 결과를 필터링하는 HAVING 절을 사용해야 한다.*/