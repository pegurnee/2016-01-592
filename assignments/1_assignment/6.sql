select
  `the_term`
, max(case when `course` == '111' then `enrolled` else null end) as `111`
, max(case when `course` == '211' then `enrolled` else null end) as `211`
, max(case when `course` == '311' then `enrolled` else null end) as `311`
, max(case when `course` == '112' then `enrolled` else null end) as `112`
, max(case when `course` == '212' then `enrolled` else null end) as `212`

from
  (
    select
      TERM_CODE_KEY               as `the_term`
    , sum(ACTUAL_ENROLLMENT)      as `enrolled`
    , CRSE_NUMBER                 as `course`
    , substr(TERM_CODE_KEY, 0, 5) as `year`
    , case
        when substr(TERM_CODE_KEY, -2) == '10' then
          'fall'
        else
          'winter'
        end                       as `semester`
    from
      enrollment
    where
      DEPT_CODE='COSC'
      and
        (
          CRSE_NUMBER='111'
          or CRSE_NUMBER='112'
          or CRSE_NUMBER='211'
          or CRSE_NUMBER='212'
          or CRSE_NUMBER='311'
        )
    group by
      TERM_CODE_KEY, CRSE_NUMBER
  ) as raw
group by
  `the_term`;
