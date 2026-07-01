{% macro get_season(X) %}
CASE WHEN MONTH(TO_Timestamp({{X}})) IN (12,1,2)
    THEN 'SPRING'
    WHEN MONTH(TO_Timestamp({{X}})) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END
{% endmacro %}

{% macro get_day_type(X) %}

CASE
    WHEN dayname(TO_Timestamp({{X}})) in ('sat', 'sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END
    
{% endmacro %}