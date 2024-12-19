with 
    
    cte_source as (
        select *
        from {{ source('lnd','film_category') }}
    ),

    cte_final as (
        select *,
            {{ ldts('now()') }} as LDTS 
        from cte_source
    )

select * from cte_final