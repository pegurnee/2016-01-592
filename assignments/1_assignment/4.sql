--gives the total credit hour production by department of the college of arts and sciences for fall of 2015
select
  sum(cast(CREDIT_HOURS as Integer)) as `hour production`
, STVDEPT_DESC
from
  enrollment
, department
where
  COLL_CODE = 'AS'
  and TERM_CODE_KEY = '201510'
  and STVDEPT_CODE = DEPT_CODE
group by
  STVDEPT_DESC
order by
  `hour production` desc;
