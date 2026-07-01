WITH TRIPS as (

Select 
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_Timestamp(started_AT)) AS TRIP_DATE,
start_statio_id as start_station_id,
start_station_name as start_station_name,
end_station_id,
member_csual as member_casual,
timestampdiff (seconds, to_timestamp(started_at), to_timestamp(ended_at)) AS trip_duration_seconds

FROM {{ source('demo', 'bike') }}

where RIDE_ID != 'ride_id'
limit 10

)

Select * 
FROM TRIPS