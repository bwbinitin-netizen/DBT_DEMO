With CTE AS (
Select
TO_Timestamp(STARTED_AT) AS STARTED_AT,
Date(TO_Timestamp(STARTED_AT)) AS DATE_STARTED_AT,
hour(TO_Timestamp(STARTED_AT)) AS HOUR_STARTED_AT,
dayname(TO_Timestamp(STARTED_AT)),

{{get_day_type('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR

from {{ source('demo', 'bike') }}    
where STARTED_AT != 'started_at'
)

select *
from CTE
