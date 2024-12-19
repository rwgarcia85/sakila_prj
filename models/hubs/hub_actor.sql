{{ config(materialized='incremental')    }}

{%- set source_model = "stg_actor"   -%}
{%- set src_pk = "hsh_actor"          -%}
{%- set src_nk = "actor_id"          -%}
{%- set src_ldts = "ldts"      -%}
{%- set src_source = "source_system"   -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}