{%- macro ldts(col) -%}
    cast({{ col }} as date)
{%- endmacro -%}
