with 
    
    cte_source as (
        select *
        from {{ source('lnd','address') }}
    ),

    cte_final as (
        select *,
            {{ ldts('now()') }} as LDTS 
        from cte_source
    )

select * from cte_final