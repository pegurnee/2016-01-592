--shows number of non-cs classes that used Pray-Harrold 520
select
  substr(TERM_CODE_KEY, 0, 5)       as `year`
, case
    when substr(TERM_CODE_KEY, -2) == '10' then
      'fall'
    else
      'winter'
    end                             as `semester`
, count(DEPT_CODE)                  as `num courses`
from
  enrollment
where
  BLDG_CODE1='PRAY-H'
  and ROOM_CODE1='520'
  and DEPT_CODE <> 'COSC'
group by
  DEPT_CODE, TERM_CODE_KEY
order by
  TERM_CODE_KEY;
