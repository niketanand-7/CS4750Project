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
