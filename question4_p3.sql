USE ClassProjectV2;
GO


-- Question 4

-- 1. Aggregate Query
-- Giving me count of total companies in my db
SELECT COUNT(*) AS totalCompanies
FROM company;

-- -- Answer: There is 1 application for each user

-- -- 2. Aggregate Query
-- Average Salary of Each company
SELECT c.name AS company_name, AVG(ft.salary) AS average_salary
FROM company c
JOIN job j ON c.companyId = j.companyId
JOIN fullTime ft ON j.jobId = ft.jobId
GROUP BY c.name
ORDER BY average_salary DESC;

-- 3. Join Query 
-- Giving me the smallest salary
SELECT MIN(salary_amount) AS smallestSalary
FROM (
    SELECT
        j.jobId,
        CASE
            WHEN f.salary IS NOT NULL THEN f.salary
            WHEN i.hourlyPay IS NOT NULL THEN i.hourlyPay * 2080
            ELSE NULL
        END AS salary_amount
    FROM
        job j
    LEFT JOIN
        fullTime f ON j.jobId = f.jobId
    LEFT JOIN
        internship i ON j.jobId = i.jobId
) AS salaries
WHERE salary_amount IS NOT NULL;


-- -- 4. Join Query
-- Giving me hourly pay in descending order
SELECT TOP 5 j.jobTitle, c.name AS company_name, i.hourlyPay
FROM internship i
JOIN job j ON i.jobId = j.jobId
JOIN company c ON j.companyId = c.companyId
ORDER BY i.hourlyPay DESC;

-- -- 5. Subquery
-- Companies that have internships longer than 91 days
SELECT DISTINCT c.name AS company_name
FROM company c
WHERE c.companyId IN (
    SELECT j.companyId
    FROM job j
    JOIN internship i ON j.jobId = i.jobId
    WHERE DATEDIFF(day, i.startDate, i.endDate) > 91
);

-- -- -- 6. SubQuery 
-- all jobs that have a higher salary than the average salary
SELECT
    j.jobTitle,
    f.salary
FROM
    job j
JOIN
    fullTime f ON j.jobId = f.jobId
WHERE
    f.salary > (
        SELECT AVG(salary) FROM fullTime
    );


-- 7. Subquery
-- all emails that are related to techcorp
SELECT COUNT(*) AS totalApplications
FROM application a
JOIN job j ON a.jobId = j.jobId
JOIN company c ON j.companyId = c.companyId
WHERE c.name = 'TechCorp';


-- 8. Join statement 
-- Top 3 cities with most jobs
SELECT TOP 3
    jl.location AS city,
    COUNT(j.jobId) AS jobCount
FROM
    job j
JOIN
    job_location jl ON j.jobId = jl.jobId
GROUP BY
    jl.location
ORDER BY
    jobCount DESC;

-- 9.
SELECT
    a.applicationId,
    a.jobId,
    j.jobTitle,
    c.name AS companyName,
    a.status,
    a.additionalNotes,
    a.createdDate
FROM
    application a
JOIN
    job j ON a.jobId = j.jobId
JOIN
    company c ON j.companyId = c.companyId
WHERE
    a.email = 'alice.smith@example.com';

-- 10. Subquery
-- Number of rejected applications
SELECT
    COUNT(*) AS totalRejectedApplications
FROM
    application
WHERE
    applicationId IN (
        SELECT
            applicationId
        FROM
            application
        WHERE
            status = 'Rejected'
    );





