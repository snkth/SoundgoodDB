FIRST QUERY:

SELECT
	EXTRACT(month FROM school_activity.date_and_time) AS month_number,
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
GROUP BY month_number
ORDER BY month_number ASC

SECOND QUERY:

SELECT
	COUNT(no_siblings) AS no_siblings,
	COUNT(one_sibling) AS one_sibling,
	COUNT(two_siblings) AS two_siblings
FROM(
	SELECT
		CASE WHEN COUNT = 0 THEN COUNT END AS no_siblings,
		CASE WHEN COUNT = 1 THEN COUNT END AS one_sibling,
		CASE WHEN COUNT = 2 THEN COUNT END AS two_siblings
	FROM(
		SELECT
			COUNT(sibling_id)
			FROM(
				SELECT
					student.student_id,
					student_sibling.sibling_id
				FROM student
				FULL OUTER JOIN student_sibling
				ON student.student_id = student_sibling.student_id) as siblings
				GROUP BY student_id
		) as sibling_table
	) as final_sibling_table



THIRD QUERY:

SELECT
    school_activity.instructor_id,
    COUNT(school_activity.activity_type_id) as total_lessons
FROM school_activity
WHERE EXTRACT (month FROM school_activity.date_and_time) = EXTRACT (month FROM CURRENT_DATE)
GROUP BY school_activity.instructor_id
HAVING COUNT(school_activity.activity_type_id) > 2
ORDER BY COUNT(school_activity.activity_type_id) DESC


THIRD QUERY (EXTENDED):

SELECT
	school_activity.instructor_id,
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
WHERE extract (month FROM school_activity.date_and_time) = extract (month FROM CURRENT_DATE)
GROUP BY school_activity.instructor_id  
HAVING COUNT(school_activity.activity_type_id) > 2

ORDER BY COUNT(school_activity.activity_type_id) DESC




