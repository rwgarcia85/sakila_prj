
{%- set yaml_metadata -%}
source_model: "lnd_actor"
derived_columns:
  source_system: "!sakila"
  ldts: {{ ldts("now()") }}
  ledts: {{ ledts() }}
hashed_columns:
  hsh_actor: "actor_id"
  hsh_diff:
    is_hashdiff: true
    columns:
      - "actor_id"
      - "first_name"
      - "last_name"
      - "last_update"
      - "source_system"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}