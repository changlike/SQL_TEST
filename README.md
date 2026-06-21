### PROGRAMMERS SQL 기출 문제 풀이 

[기본 문법] <br>
JOIN : 여러 테이블을 결합하여 원하는 데이터를 조회 <br>
ON : 두 테이블을 어떤 컬럼으로 연결할지 지정 <br>
IN : 서브쿼리 결과 목록에 포함되는 값만 조회 <br>
서브쿼리 : 괄호 안의 SELECT문으로, 먼저 실행되어 결과를 반환 <br>
WHERE : 행(Row)을 조건에 따라 필터링 <br>
ORDER BY : 조회 결과를 정렬 <br>
DESC : 내림차순 정렬 (큰 값 → 작은 값) <br>
CONCAT(COLUMNS,'단위') : 컬럼값에 단위를 붙여주는 방법 <br>


## SQL 구문 헷갈린 포인트

#### 1. OR, AND 뒤에는 항상 완전한 조건식이 와야 한다

❌ 잘못된 예

```sql
WHERE name LIKE '%Christmas%'
   OR '%Santa%'
```

```sql
WHERE rating = 'R'
   OR 'NC-17'
```

✔ 올바른 예

```sql
WHERE name LIKE '%Christmas%'
   OR name LIKE '%Santa%'
```

```sql
WHERE rating = 'R'
   OR rating = 'NC-17'
```

---

#### 2. 같은 컬럼을 여러 값과 비교할 때는 IN 사용 가능

다음 두 쿼리는 동일하다.

```sql
WHERE rating = 'R'
   OR rating = 'NC-17'
```

```sql
WHERE rating IN ('R', 'NC-17')
```

실무에서는 IN을 더 자주 사용한다.

```sql
WHERE rating IN ('R', 'PG', 'PG-13', 'NC-17')
```

---

#### 3. NOT IN

다음 두 쿼리는 동일하다.

```sql
WHERE rating NOT IN ('R', 'NC-17')
```

```sql
WHERE rating != 'R'
  AND rating != 'NC-17'
```

---

#### 4. AND 와 OR 우선순위

SQL은 AND를 OR보다 먼저 계산한다.

```sql
WHERE A
   OR B
   AND C
```

실제로는

```sql
WHERE A
   OR (B AND C)
```

로 해석된다.

---

#### 5. AND 와 OR를 섞을 때는 괄호 사용

의도를 명확하게 표현하기 위해 괄호를 쓰는 습관을 들인다.

```sql
WHERE (rating = 'R' OR rating = 'NC-17')
  AND title NOT LIKE '%A'
```

---

#### 6. LIKE

#### 포함 여부

```sql
WHERE title LIKE '%Christmas%'
```

→ Christmas가 포함된 제목

#### 특정 문자로 시작

```sql
WHERE title LIKE 'A%'
```

→ A로 시작

#### 특정 문자로 끝

```sql
WHERE title LIKE '%A'
```

→ A로 끝

---

#### 7. NOT LIKE

```sql
WHERE title NOT LIKE '%A'
```

→ A로 끝나지 않음

---

#### 8. 여러 NOT LIKE 조건

"A, E, I, O, U 중 어떤 것으로도 끝나지 않는 제목"

✔ AND 사용

```sql
WHERE title NOT LIKE '%A'
  AND title NOT LIKE '%E'
  AND title NOT LIKE '%I'
  AND title NOT LIKE '%O'
  AND title NOT LIKE '%U'
```

❌ OR 사용

```sql
WHERE title NOT LIKE '%A'
   OR title NOT LIKE '%E'
```

거의 모든 행이 TRUE가 되어 버린다.

---

#### 9. SQL 작성 순서

```sql
SELECT 컬럼명
FROM 테이블명
WHERE 조건식;
```

예시

```sql
SELECT title
FROM film
WHERE rating IN ('R', 'NC-17');
```

---* 끝 검색 → LIKE '%문자'
* 여러 NOT LIKE는 보통 AND로 연결
