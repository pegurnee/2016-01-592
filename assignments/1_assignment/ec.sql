WITH RECURSIVE times as (
  select 0 as the_time
  union all
  select the_time + 5
  from times
  where the_time < 2355
)
select
  DAYS as `Day`
, the_time as `Time`
, sum(ACTUAL_ENROLLMENT) as `Number Enrolled`
from
  enrollment
, times
where
  DAYS like '%T%'
  and TERM_CODE_KEY = '201510'
  and cast(BEGIN_TIME1 as Integer) <= `Time`
  and cast(END_TIME1 as Integer) >= `Time`
group by
  `Time`;
