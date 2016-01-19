select
  `Day`
, (min(`raw`.`Time`) || '-' || max(`raw`.`Time`)) as `Time Span`
, `Number Enrolled`
from
  (WITH RECURSIVE times as (
    select '00:00' as the_time
    union all
    select time(the_time, '+5 minutes')
    from times
    where the_time < time('23:55')
  )
  select
    DAYS as `Day`
  , time(
      substr('00' || (BEGIN_TIME1 / 100), -2, 2)  || ':'
        || substr('00' || (BEGIN_TIME1 % 100), -2, 2)
    ) as start_time
  , time(
      substr('00' || (END_TIME1 / 100), -2, 2)    || ':'
        || substr('00' || (END_TIME1 % 100), -2, 2)
    ) as end_time
  , the_time as `Time`
  , sum(ACTUAL_ENROLLMENT) as `Number Enrolled`
  from
    enrollment
  , times
  where
    DAYS like '%T%'
    and TERM_CODE_KEY = '201510'
    and
      (
        (BEGIN_TIME1 < `Time` and END_TIME1 > `Time`)
        or BEGIN_TIME1 == `Time`
        or END_TIME1 == `Time`
      )
  group by
    `Time`) as raw
group by
  `Number Enrolled`
order by
  `Time Span`;
