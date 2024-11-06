-- p4
-- stored procedure 1

CREATE PROCEDURE spApplyForJob
    @userEmail VARCHAR(255),
    @jobId INT,
    @additionalNotes TEXT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert a new application record
    INSERT INTO application (email, jobId, status, additionalNotes, createdDate)
    VALUES (@userEmail, @jobId, 'Applied', @additionalNotes, GETDATE());

    DECLARE @applicationId INT = SCOPE_IDENTITY();

    -- Insert into submits table to record the submission
    INSERT INTO submits (email, applicationId)
    VALUES (@userEmail, @applicationId);

    -- Return the new application ID
    SELECT @applicationId AS ApplicationId;
END
GO

-- stored procedure 2
CREATE PROCEDURE spGetUserApplications
    @userEmail VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        a.applicationId,
        a.status,
        a.additionalNotes,
        a.createdDate,
        j.jobId,
        j.jobTitle,
        c.companyId,
        c.name AS CompanyName
    FROM application a
    INNER JOIN job j ON a.jobId = j.jobId
    INNER JOIN company c ON j.companyId = c.companyId
    WHERE a.email = @userEmail
    ORDER BY a.createdDate DESC;
END
GO

-- stored procedure 3
CREATE PROCEDURE spScheduleInterview
    @applicationId INT,
    @date DATE,
    @roundType VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Determine the next round number for the application
    DECLARE @nextRound INT;
    SELECT @nextRound = ISNULL(MAX(round), 0) + 1
    FROM interview
    WHERE applicationId = @applicationId;

    -- Insert a new interview record
    INSERT INTO interview (applicationId, date, round, roundType)
    VALUES (@applicationId, @date, @nextRound, @roundType);

    DECLARE @interviewId INT = SCOPE_IDENTITY();

    -- Insert into contains table to associate the interview with the application
    INSERT INTO [contains] (applicationId, interviewId)
    VALUES (@applicationId, @interviewId);

    -- Update application status to 'Interview Scheduled' if not already
    UPDATE application
    SET status = 'Interview Scheduled'
    WHERE applicationId = @applicationId
      AND status != 'Interview Scheduled';

    -- Return the new interview ID
    SELECT @interviewId AS InterviewId;
END
GO


-- function 1
-- Helps in calculating the length of an internship, which is valuable information for applicants to understand the time commitment required. It ensures consistency in how the duration is calculated and displayed throughout your application.
CREATE FUNCTION fnGetInternshipDuration (@jobId INT)
RETURNS INT
AS
BEGIN
    DECLARE @duration INT;

    SELECT @duration = DATEDIFF(day, startDate, endDate)
    FROM internship
    WHERE jobId = @jobId;

    RETURN @duration;
END;
GO

-- function 2
-- Allows you to track and display the number of applications a user has submitted. This can enhance user engagement by providing them with insights into their activity. It's also useful for administrative reporting and analytics.
CREATE FUNCTION fnGetUserApplicationCount (@userEmail VARCHAR(255))
RETURNS INT
AS
BEGIN
    DECLARE @appCount INT;

    SELECT @appCount = COUNT(*)
    FROM application
    WHERE email = @userEmail;

    RETURN @appCount;
END;
GO

-- function 3
-- Simplifies the process of retrieving and displaying all benefits associated with a full-time job. By encapsulating this logic in a function, you avoid repeating code and ensure that all benefits are consistently presented to users.
CREATE FUNCTION fnGetJobBenefits (@jobId INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @benefits VARCHAR(MAX);

    SELECT @benefits = 
        STUFF((
            SELECT ', ' + benefit
            FROM fullTime_benefits
            WHERE jobId = @jobId
            FOR XML PATH(''), TYPE
        ).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

    RETURN @benefits;
END;
GO

-- view 1
--
CREATE VIEW vwJobPostings AS
SELECT
    j.jobId,
    j.jobTitle,
    c.companyId,
    c.name AS CompanyName,
    c.description AS CompanyDescription,
    jl.location,
    CASE
        WHEN i.jobId IS NOT NULL THEN 'Internship'
        WHEN f.jobId IS NOT NULL THEN 'Full-Time'
        ELSE 'Other'
    END AS JobType
FROM job j
INNER JOIN company c ON j.companyId = c.companyId
LEFT JOIN job_location jl ON j.jobId = jl.jobId
LEFT JOIN internship i ON j.jobId = i.jobId
LEFT JOIN fullTime f ON j.jobId = f.jobId;
GO


-- view 2
--
CREATE VIEW vwUserApplications AS
SELECT
    a.applicationId,
    a.email AS UserEmail,
    u.name AS UserName,
    a.status,
    a.additionalNotes,
    a.createdDate,
    j.jobId,
    j.jobTitle,
    c.companyId,
    c.name AS CompanyName
FROM application a
INNER JOIN [user] u ON a.email = u.email
INNER JOIN job j ON a.jobId = j.jobId
INNER JOIN company c ON j.companyId = c.companyId;
GO

-- view 3
--
CREATE VIEW vwFullTimeJobBenefits AS
SELECT
    j.jobId,
    j.jobTitle,
    c.companyId,
    c.name AS CompanyName,
    f.startDate,
    f.salary,
    fb.benefit
FROM fullTime f
INNER JOIN job j ON f.jobId = j.jobId
INNER JOIN company c ON j.companyId = c.companyId
LEFT JOIN fullTime_benefits fb ON f.jobId = fb.jobId;
GO




