WITH BIKE as (

Select distinct
start_statio_id as station_id,
start_station_name as station_name,
start_lat as station_lat,
start_lng as start_station_lng

FROM {{ source('demo', 'bike') }}
Where RIDE_ID != 'ride_id'


)

select * from BIKE