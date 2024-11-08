-- p4
-- stored procedure 1
-- This stored procedure allows a user to apply for a job by inserting a new application record into the database. It records the application details, logs the submission, and returns the new application ID.



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
-- This stored procedure retrieves all job applications submitted by a specific user, along with related job and company information, providing a comprehensive view of the user's application history.


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
-- This stored procedure schedules a new interview for a job application. It determines the next interview round, records the interview details, associates it with the application, updates the application status, and returns the new interview ID.
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


-- Part 4: Trigger: the trigger here will change application status of an application to "Interviewing" when an interview is inserted into the DB
-- learned about the "inserted" table from here: https://learn.microsoft.com/en-us/sql/relational-databases/triggers/use-the-inserted-and-deleted-tables?view=sql-server-ver16

CREATE TRIGGER application_status_interviewing ON interview AFTER INSERT AS BEGIN
    UPDATE [application] SET status = 'Interviewing' FROM [application] a 
    JOIN [contains] c ON a.applicationId = c.applicationId JOIN inserted i 
    ON c.interviewId = i.interviewId;
END;

-- Part 5: Column Encryption. We will encrypt the user login password to handle authentication into website.
-- while the commands won't add the encrypted passwords to the db, it will set it up so that on user signup we can
-- use the key and certificate to encrypt passwords into db

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'password123';

CREATE CERTIFICATE UserCert WITH SUBJECT = 'Certificate for user password encryption';

CREATE SYMMETRIC KEY UserKey WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE UserCert;

ALTER TABLE [user] ADD EncryptedPassword VARBINARY(256);

-- Part 6: Non-clustered Indexes

-- this will be useful index because a primary feature of sight will be displaying an interacting with the job openings in the job table
CREATE NONCLUSTERED INDEX idx_jobId ON job(jobId);

-- this will be useful index because we will often need to access an application in relation to the logged in user (by email) and find out that applications status
CREATE NONCLUSTERED INDEX idx_applicationId_email_status ON [application](applicationId, email, status);

-- this will be a useful index because it represents a relation table that connects interviews to an application. This will be accessed a lot in joins\
-- when trying to get information about a specific applications interviews.
CREATE NONCLUSTERED INDEX idx_contains_applicationId_interviewId ON [contains](applicationId, interviewId);


