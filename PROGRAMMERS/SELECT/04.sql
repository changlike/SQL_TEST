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

/* 궁금증 
? 왜 SELECT의 FLAVOR 앞에 F라는 테이블 이름을 명시해줘야하나?
? JOIN할때 저 형식으로만 해야되는지? 
? 지금은 각 컬럼이 다른 테이블을 취하지만, 만약에 다른 테이블에 같은 컬럼이 있을 경우는 어떤 테이블을 취급해야되는가?*/ 