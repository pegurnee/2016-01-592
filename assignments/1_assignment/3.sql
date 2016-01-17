select
  sum(cast(ACTUAL_ENROLLMENT as Integer)) as `num enrolled`,
  STVTERM_ACYR_CODE as `year offered`
from term, enrollment
where
  DEPT_CODE = 'COSC'
  and CRSE_NUMBER = '111'
  and STVTERM_CODE=TERM_CODE_KEY
group by STVTERM_ACYR_CODE;
