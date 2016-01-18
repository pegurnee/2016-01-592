select
  count(*) as `online courses`
, STVTERM_ACYR_CODE as `year offered`
from
  term
, classes
, enrollment
where
  STVSCHD_CODE='DEO'
  and STVSCHD_CODE=SCHD_CODE_MEET1
  and STVTERM_CODE=TERM_CODE_KEY
group by STVTERM_ACYR_CODE;
