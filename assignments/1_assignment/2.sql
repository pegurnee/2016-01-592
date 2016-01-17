select
  cast(ACTUAL_ENROLLMENT as Integer) as `num enrolled`,
  TITLE as `name`
from enrollment
where
  TERM_CODE_KEY like '2015%'
order by `num enrolled` desc
limit 10;
