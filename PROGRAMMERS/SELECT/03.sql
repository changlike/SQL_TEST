-- 과일로 만든 아이스크림 고르기 

/*문제 설명
다음은 아이스크림 가게의 상반기 주문 정보를 담은 FIRST_HALF 테이블과 
아이스크림 성분에 대한 정보를 담은 ICECREAM_INFO 테이블입니다. 

FIRST_HALF 테이블 구조는 다음과 같으며, SHIPMENT_ID, FLAVOR, TOTAL_ORDER 는 
각각 아이스크림 공장에서 아이스크림 가게까지의 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량을 나타냅니다. 
FIRST_HALF 테이블의 기본 키는 FLAVOR입니다.

ICECREAM_INFO 테이블 구조는 다음과 같으며, FLAVOR, INGREDITENT_TYPE 은 
각각 아이스크림 맛, 아이스크림의 성분 타입을 나타냅니다. 
INGREDIENT_TYPE에는 아이스크림의 주 성분이 설탕이면 sugar_based라고 입력되고, 
아이스크림의 주 성분이 과일이면 fruit_based라고 입력됩니다. ICECREAM_INFO의 기본 키는 FLAVOR입니다. 
ICECREAM_INFO테이블의 FLAVOR는 FIRST_HALF 테이블의 FLAVOR의 외래 키입니다.*/

/*문제
상반기 아이스크림 총주문량이 3,000보다 높으면서 
아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.*/

SELECT F.FLAVOR
FROM FIRST_HALF F JOIN ICECREAM_INFO I ON F.FLAVOR = I.FLAVOR
WHERE F.TOTAL_ORDER > 3000 
AND I.INGREDIENT_TYPE = 'fruit_based'
ORDER BY F.TOTAL_ORDER DESC;



/* Q1. 왜 SELECT의 FLAVOR 앞에 F 같은 테이블 별칭을 붙여야 하나?

JOIN 시 같은 이름의 컬럼이 여러 테이블에 존재할 수 있으므로
어떤 테이블의 컬럼인지 명확하게 구분하기 위해 사용한다.

예)
SELECT F.FLAVOR

컬럼명이 겹치지 않더라도 가독성과 유지보수를 위해
습관적으로 별칭을 붙이는 경우가 많다.
*/

/* Q2. JOIN은 꼭 이 형식으로만 해야 하나?

FROM A
JOIN B
ON A.COL = B.COL

은 가장 기본적인 JOIN 문법이다.

ON 절에서 두 테이블을 연결할 기준 컬럼을 지정하여
관련 있는 데이터끼리 결합한다.

다만 JOIN에는
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN

등 여러 종류가 있으며,
문제 상황에 따라 적절한 JOIN을 선택한다.
*/


/* Q3. 여러 테이블에 같은 컬럼명이 있으면 어떤 테이블의 컬럼을 사용해야 하나?

문제에서 필요한 데이터가 들어있는 테이블을 기준으로 선택한다.

예)
SELECT F.FLAVOR
또는
SELECT I.FLAVOR

만약 JOIN 조건이

ON F.FLAVOR = I.FLAVOR

이라면 두 컬럼의 값은 동일하므로
어느 쪽을 사용해도 결과는 같다.

하지만 같은 이름의 컬럼이라도 의미나 값이 다를 수 있으므로
항상 어떤 테이블의 컬럼인지 명확히 확인해야 한다.
*/