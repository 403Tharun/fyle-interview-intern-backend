SELECT 
    COUNT(*) AS num_grade_As
FROM 
    assignments
WHERE 
    teacher_id = (
        SELECT 
            teacher_id
        FROM 
            (
                SELECT 
                    teacher_id, 
                    COUNT(*) AS assignment_count
                FROM 
                    assignments
                GROUP BY 
                    teacher_id
                ORDER BY 
                    assignment_count DESC
                LIMIT 1
            ) AS MaxTeacher
    )
    AND grade = 'A';
