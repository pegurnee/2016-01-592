--shows how many 400-level computer science courses were offered per term
select
  substr(TERM_CODE_KEY, 0, 5)       as `year`
, case
    when substr(TERM_CODE_KEY, -2) == '10' then
      'fall'
    else
      'winter'
    end                             as `semester`
, count(CRSE_NUMBER)                as `Num of 400-level CS courses offered`
from
  enrollment
where
  CRSE_NUMBER like '4%'
  and DEPT_CODE='COSC'
group by
  TERM_CODE_KEY;
