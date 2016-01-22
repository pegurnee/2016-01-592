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
, case
    when DEPT_CODE == 'COSC' then
      0
    else
      count(DEPT_CODE)
    end                             as `non cosc`
from
  enrollment
where
  BLDG_CODE1='PRAY-H'
  and ROOM_CODE1='520'
group by
  DEPT_CODE, TERM_CODE_KEY
order by
  TERM_CODE_KEY;
