{% macro events_per_type(input_table, column_type) %} 

    {% set event_types = dbt_utils.get_column_values(input_table, column_type) %}
    {% for types in event_types %}
        , sum(case when event_type = '{{ types }}' then 1 else 0 end) AS total_{{ types }}
    {% endfor %}

{% endmacro %} 