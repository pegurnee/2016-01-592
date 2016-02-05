--displays the amount of students enrolled in a classes given a specific time span
select
  `Day`
, (min(`raw`.`Time`) || '-' || max(`raw`.`Time`)) as `Time Span`
, `Number Enrolled`
from
  (WITH RECURSIVE times as (
    select '23:55' as the_time
    union all
    select time(the_time, '+5 minutes')
    from times
    where the_time < time('23:55')
  )
  select
    `Day`
  , the_time as `Time`
  , sum(`enrolled`) as `Number Enrolled`
  from
    (
      select
        'T' as 'Day'
      , time(
          substr('00' || (BEGIN_TIME1 / 100), -2, 2)  || ':'
            || substr('00' || (BEGIN_TIME1 % 100), -2, 2)
        ) as start_time
      , time(
          substr('00' || (END_TIME1 / 100), -2, 2)    || ':'
            || substr('00' || (END_TIME1 % 100), -2, 2)
        ) as end_time
      , ACTUAL_ENROLLMENT as 'enrolled'
      from
        enrollment
      where
        DAYS like '%T%'
        and TERM_CODE_KEY = '201510'
      group by
        start_time, end_time
    ) as dayz
  , times
  where
    (`Time` > start_time and `Time` < end_time)
    or start_time == `Time`
    or end_time == `Time`
  group by
    `Time`) as raw
group by
  `Number Enrolled`
order by
  `Time Span`;
