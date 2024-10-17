USE ClassProjectV2;
GO


-- Question 4

-- 1. Aggregate Query with Join
SELECT u.email, u.name, COUNT(a.applicationId) AS total_applications
FROM [user] u
JOIN application a ON u.email = a.email
GROUP BY u.email, u.name
ORDER BY total_applications DESC;

-- -- Answer: There is 1 application for each user

-- -- 2. Aggregate Query with Joins
-- SELECT c.name AS company_name, AVG(ft.salary) AS average_salary
-- FROM company c
-- JOIN job j ON c.companyId = j.companyId
-- JOIN fullTime ft ON j.jobId = ft.jobId
-- GROUP BY c.name
-- ORDER BY average_salary DESC;

-- -- 3. Join Query
-- SELECT DISTINCT u.email, u.name
-- FROM [user] u
-- JOIN application a ON u.email = a.email
-- JOIN job j ON a.jobId = j.jobId
-- WHERE j.jobTitle LIKE '%Engineer%';

-- -- 4. Subquery with Aggregate Function
-- SELECT TOP 5 j.jobTitle, c.name AS company_name, i.hourlyPay
-- FROM internship i
-- JOIN job j ON i.jobId = j.jobId
-- JOIN company c ON j.companyId = c.companyId
-- ORDER BY i.hourlyPay DESC;

-- -- 5. Subquery
-- SELECT DISTINCT c.name AS company_name
-- FROM company c
-- WHERE c.companyId IN (
--     SELECT j.companyId
--     FROM job j
--     JOIN internship i ON j.jobId = i.jobId
--     WHERE DATEDIFF(day, i.startDate, i.endDate) > 90
-- );

-- -- 6. Aggregate Query
-- SELECT status, COUNT(applicationId) AS total_applications
-- FROM application
-- GROUP BY status;

-- -- 7. Subquery with Aggregate Function
-- SELECT j.jobTitle, c.name AS company_name, a.total_applications
-- FROM (
--     SELECT jobId, COUNT(applicationId) AS total_applications
--     FROM application
--     GROUP BY jobId
--     HAVING COUNT(applicationId) >= 1
-- ) a
-- JOIN job j ON a.jobId = j.jobId
-- JOIN company c ON j.companyId = c.companyId
-- ORDER BY a.total_applications DESC;

-- -- 8. Subquery
-- SELECT DISTINCT u.email, u.name
-- FROM [user] u
-- WHERE u.email IN (
--     SELECT email
--     FROM application a
--     WHERE a.jobId IN (SELECT jobId FROM internship)
-- )
-- AND u.email IN (
--     SELECT email
--     FROM application a
--     WHERE a.jobId IN (SELECT jobId FROM fullTime)
-- );

-- -- 9. Subquery
-- SELECT c.name AS company_name
-- FROM company c
-- WHERE c.companyId NOT IN (
--     SELECT DISTINCT j.companyId
--     FROM job j
--     JOIN application a ON j.jobId = a.jobId
-- );


-- -- 10. Aggregate Query with Join
-- SELECT AVG(u.classYear) AS average_class_year
-- FROM [user] u
-- JOIN application a ON u.email = a.email
-- WHERE a.status = 'Accepted';




