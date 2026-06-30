With CTE AS (
Select
TO_Timestamp(STARTED_AT) AS STARTED_AT,
Date(TO_Timestamp(STARTED_AT)) AS DATE_STARTED_AT,
hour(TO_Timestamp(STARTED_AT)) AS HOUR_STARTED_AT,
dayname(TO_Timestamp(STARTED_AT)),

CASE
    WHEN dayname(TO_Timestamp(STARTED_AT)) in ('sat', 'sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,

CASE WHEN MONTH(TO_Timestamp(STARTED_AT)) IN (12,1,2)
    THEN 'SPRING'
    WHEN MONTH(TO_Timestamp(STARTED_AT)) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS STATION_OF_YEAR

from {{ source('demo', 'bike') }}    
where STARTED_AT != 'started_at'
)

select *
from CTE
