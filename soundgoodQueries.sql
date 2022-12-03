SELECT

	TO_CHAR(school_activity.date_and_time, 'Month') AS month,

	COUNT(school_activity.activity_type_id) AS total_lessons,
	
	COUNT(school_activity_id)
		FILTER (WHERE school_activity.activity_type_id = 1)
		AS individual,
	
	COUNT(school_activity_id)
		FILTER (WHERE school_activity.activity_type_id = 2)
		AS group,
		
	COUNT(school_activity_id)
		FILTER (WHERE school_activity.activity_type_id = 3)
		AS ensamble
	
FROM school_activity
GROUP BY month
ORDER BY month;

