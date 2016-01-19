select
  DAYS as `Day`
, (WITH RECURSIVE
  get_time(x) AS (
     SELECT 0
     UNION ALL
     SELECT x + 5 FROM get_time
      LIMIT 2355 / 5
) select x from get_time) as `Time`
, sum(ACTUAL_ENROLLMENT) as `Number Enrolled`
from
  enrollment
where
  DAYS like '%T%'
  and TERM_CODE_KEY = '201510'
  and cast(BEGIN_TIME1 as Integer) <= `Time`
  and cast(END_TIME1 as Integer) >= `Time`
group by `Time`, `Day`
limit 10;
