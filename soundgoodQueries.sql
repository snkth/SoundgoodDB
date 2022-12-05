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



FOURTH QUERY

SELECT
	genre_name AS genre,
	CASE
		WHEN day = 1 THEN 'monday'
		WHEN day = 2 THEN 'tuesday'
		WHEN day = 3 THEN 'wednesday'
		WHEN day = 4 THEN 'thursday'
		WHEN day = 5 THEN 'friday'
		WHEN day = 6 THEN 'saturday'
		WHEN day = 7 THEN 'sunday'
	END as day,
	CASE
		WHEN spots_left = 0 THEN 'full'
		WHEN spots_left >= 1 AND spots_left <= 2 THEN 'few'
		WHEN spots_left >= 3 THEN 'many'
	END as availability
FROM(
	SELECT
		genre_name,
		EXTRACT(dow FROM date_and_time) AS day,
		maximum_students - COUNT (student_id) AS spots_left
	FROM(
		SELECT
			school_activity.school_activity_id,
			school_activity.genre_id,
			genre.genre_name,
			school_activity.date_and_time,
			activity_type.maximum_students,
			student_school_activity.student_id
		FROM school_activity
			LEFT JOIN activity_type
				ON school_activity.activity_type_id = activity_type.activity_type_id
			LEFT JOIN student_school_activity
				ON school_activity.school_activity_id = student_school_activity.school_activity_id
			LEFT JOIN genre
				ON school_activity.genre_id = genre.genre_id
		WHERE school_activity.activity_type_id = 3 AND EXTRACT(week FROM school_activity.date_and_time) = EXTRACT(week FROM CURRENT_DATE + interval '1 week')
	) as initial_table
	GROUP BY day, genre_id, genre_name, maximum_students
	ORDER BY genre_name, day
) as refined_table




