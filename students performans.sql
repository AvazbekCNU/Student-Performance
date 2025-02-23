create database student;
use student;
select * from students;

-- data cleaning
UPDATE students
SET Assignments_Avg = (Midterm_Score + Final_Score) / 2
WHERE Assignments_Avg IS NULL;

SELECT * FROM students WHERE students IS NULL;



--  Calculate the average total score per department
SELECT department, AVG(total_score) AS avg_total_score
FROM students
GROUP BY department
ORDER BY avg_total_score DESC;

-- top 5 students based on total_score
SELECT student_id, first_name, last_name, total_score
FROM students
ORDER BY total_score DESC
LIMIT 5;

-- Count the number of students per grade category
SELECT grade, COUNT(*) AS student_count
FROM students
GROUP BY grade
ORDER BY student_count DESC;

-- Check the correlation between attendance and final scores
SELECT 
    CASE 
        WHEN `attendance (%)` >= 90 THEN '90-100%'
        WHEN `attendance (%)` >= 80 THEN '80-89%'
        WHEN `attendance (%)` >= 70 THEN '70-79%'
        WHEN `attendance (%)` >= 60 THEN '60-69%'
        ELSE 'Below 60%'
    END AS attendance_range,
    AVG(`final_score`) AS avg_final_score
FROM students
GROUP BY attendance_range
ORDER BY attendance_range DESC;


SHOW COLUMNS FROM students;
--  Analyze the impact of study hours on total score
SELECT 
    CASE 
        WHEN study_hours_per_week >= 20 THEN '20+ hours'
        WHEN study_hours_per_week >= 15 THEN '15-19 hours'
        WHEN study_hours_per_week >= 10 THEN '10-14 hours'
        ELSE 'Below 10 hours'
    END AS study_hours_category,
    AVG(total_score) AS avg_total_score
FROM students
GROUP BY study_hours_category
ORDER BY avg_total_score DESC;

-- Find students who study more than 15 hours but have low scores
SELECT student_id, first_name, last_name, study_hours_per_week, total_score
FROM students
WHERE study_hours_per_week > 15 AND total_score < 60
ORDER BY study_hours_per_week DESC;

-- Check family income level and academic performance
SELECT family_income_level, AVG(total_score) AS avg_total_score
FROM students
GROUP BY family_income_level
ORDER BY avg_total_score DESC;

--  Analyze stress levels vs. sleep hours
SELECT `Stress_Level (1-10)`, AVG(sleep_hours_per_night) AS avg_sleep
FROM students
GROUP BY `Stress_Level (1-10)`
ORDER BY `Stress_Level (1-10)`;

--  Compare average total score by gender
SELECT gender, AVG(total_score) AS avg_total_score
FROM students
GROUP BY gender;

-- Find gender distribution across departments
SELECT department, gender, COUNT(*) AS student_count
FROM students
GROUP BY department, gender
ORDER BY department, gender;

-- Find students with high attendance but low scores
SELECT student_id, first_name, last_name, 'attendance (%)', total_score
FROM students
WHERE `attendance (%)` > 90 AND total_score < 51;

-- Identify students who rarely attend but score high
SELECT student_id, first_name, last_name, 'attendance (%)', total_score
FROM students
WHERE `attendance (%)` < 51 AND total_score > 80;



