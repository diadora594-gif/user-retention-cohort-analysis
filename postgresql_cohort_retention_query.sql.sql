
with clean_cohort_users_raw AS(

	select
		user_id,
		full_name,
		email,
		country,
		signup_datetime,
		signup_source,
		signup_device,
		promo_signup_flag,
		case 
			when cleaned ~ '^\d{1,2}-\d{1,2}-\d{4}$' 
			then TO_DATE(cleaned, 'DD-MM-YYYY')
			when cleaned ~ '^\d{1,2}-\d{1,2}-\d{2}$'
			then TO_DATE(cleaned, 'DD-MM-YY')
			else null 
		end ::timestamp as clean_date_users
		
	from (
		select 
			*,
			REGEXP_REPLACE(TRIM(SPLIT_PART(signup_datetime,' ',1)),'[./]','-','g') as cleaned
		from cohort_users_raw cur
		
	     ) t

),
clean_cohort_events_raw AS(
	
	select
		event_id,
		user_id,
		event_datetime,
		event_type,
		revenue,
		case 
			when cleaned2 ~ '^\d{1,2}-\d{1,2}-\d{4}$'
			then TO_DATE(cleaned2,'DD-MM-YYYY')
			when cleaned2 ~ '^\d{1,2}-\d{1,2}-\d{2}$'
			then TO_DATE(cleaned2,'DD-MM-YY')
			else null 
		end as clean_event_date
	from (
		select
			*,
			REGEXP_REPLACE(TRIM(SPLIT_PART(event_datetime,' ',1)),'[/.]','-','g') as cleaned2
		from cohort_events_raw cer 
	) t2

),
concat_users_events as (

	select 
		use.user_id,
		promo_signup_flag,
		TO_CHAR(use.clean_date_users,'YYYY-MM') as cohort_month,
		TO_CHAR(eve.clean_event_date,'YYYY-MM') as event_month,
		(EXTRACT(year from eve.clean_event_date) - EXTRACT(year from use.clean_date_users)) * 12 + 
		(EXTRACT (month from eve.clean_event_date) - EXTRACT (month from use.clean_date_users)) as month_offset
	from clean_cohort_users_raw use
	left join clean_cohort_events_raw eve on use.user_id = eve.user_id
	where use.clean_date_users is not null
		  and eve.clean_event_date is not null 
		  and eve.event_type is not null
		  and (eve.event_type != 'test_event'
		  or eve.event_type = 'registration')

)
SELECT
	promo_signup_flag,
	cohort_month,
	month_offset,
	COUNT(distinct user_id) as user_total
from concat_users_events 
where event_month between '2025-01' and '2025-06'
group by 1,2,3
order by 1,2,3 









