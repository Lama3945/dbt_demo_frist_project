-- depends_on = {{ ref('orders_snapshot_from_src') }}
{% call statement('states', fetch_result=True) -%}

    select distinct status from {{ ref('orders_snapshot_from_src') }}

    
    {{ load_result('states')['table'] }}
    
{%- endcall %}