select
  sum(ACTUAL_ENROLLMENT
      * CREDIT_HOURS
      * case
          when LEVL_CODE1='UG' then
            296.65
          else
            597.00
          end) as `net income`
from
  enrollment
where
  COLL_CODE = 'BU'
  and TERM_CODE_KEY = '201510';
