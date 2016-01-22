select
  TERM_CODE_KEY
, case
    when substr(TERM_CODE_KEY, -2) == '10' then
      'fall'
    else
      'winter'
    end                             as `semester`
, substr(TERM_CODE_KEY, 0, 5)       as `year`
, DEPT_CODE || ' ' || CRSE_NUMBER   as `course`
, count(DEPT_CODE)                  as `num courses`
from
  enrollment
where
  BLDG_CODE1='PRAY-H'
  and ROOM_CODE1='520'
group by
  DEPT_CODE, TERM_CODE_KEY
order by
  TERM_CODE_KEY;
