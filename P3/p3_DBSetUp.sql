

CREATE DATABASE ClassProjectV2;
GO

USE ClassProjectV2;
GO

-- Question 1

CREATE TABLE [user] (
    email VARCHAR(255) PRIMARY KEY NOT NULL,  -- Email as primary key
    name VARCHAR(255) NOT NULL,      -- Name cannot be NULL
    classYear INT NOT NULL                   -- Class year
);

CREATE TABLE user_major (
    email VARCHAR(255) NOT NULL,              -- Foreign key
    major VARCHAR(100) NOT NULL,              -- Major name cannot be NULL
    PRIMARY KEY (email, major),               -- Composite primary key
    FOREIGN KEY (email) REFERENCES [user](email) ON DELETE CASCADE
);


CREATE TABLE company (
    companyId INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    name VARCHAR(255) NOT NULL,               -- Company name
    description TEXT                          -- Company description
);


CREATE TABLE job (
    jobId INT IDENTITY(1,1) PRIMARY KEY,      -- Auto-incrementing primary key
    companyId INT NOT NULL,                   -- Foreign key to company
    jobTitle VARCHAR(255) NOT NULL,           -- Job title cannot be NULL
    FOREIGN KEY (companyId) REFERENCES company(companyId) 
        ON DELETE CASCADE                     -- Deletes jobs if the company is deleted
);


CREATE TABLE job_location (
    jobId INT,                                -- Foreign key to job
    location VARCHAR(255) NOT NULL,           -- Location name cannot be NULL
    PRIMARY KEY (jobId, location),            -- Composite primary key
    FOREIGN KEY (jobId) REFERENCES job(jobId)
);


CREATE TABLE internship (
    jobId INT PRIMARY KEY,                    -- Foreign key to job, also primary key
    hourlyPay DECIMAL(10, 2),                 -- Pay rate for internship
    startDate DATE NOT NULL,                  -- Start date
    endDate DATE NOT NULL,                    -- End date
    FOREIGN KEY (jobId) REFERENCES job(jobId)
);


CREATE TABLE fullTime (
    jobId INT PRIMARY KEY,                    -- Foreign key to job, also primary key
    startDate DATE NOT NULL,                  -- Start date
    salary DECIMAL(10, 2) NOT NULL,           -- Salary
    FOREIGN KEY (jobId) REFERENCES job(jobId)
);


CREATE TABLE fullTime_benefits (
    jobId INT,                                -- Foreign key to fullTime
    benefit VARCHAR(255) NOT NULL,            -- Benefit description
    PRIMARY KEY (jobId, benefit),             -- Composite primary key
    FOREIGN KEY (jobId) REFERENCES fullTime(jobId)
);


CREATE TABLE application (
    applicationId INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    email VARCHAR(255) NOT NULL,                  -- Foreign key to user
    jobId INT NOT NULL,                           -- Foreign key to job
    status VARCHAR(50) NOT NULL,                  -- Status of the application
    additionalNotes TEXT,                         -- Additional notes
    createdDate DATE NOT NULL,                    -- Date of submission
    FOREIGN KEY (email) REFERENCES [user](email),
    FOREIGN KEY (jobId) REFERENCES job(jobId)
);


CREATE TABLE interview (
    interviewId INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    applicationId INT NOT NULL,                 -- Foreign key to application
    date DATE NOT NULL,                         -- Interview date
    round INT NOT NULL,                         -- Round number
    roundType VARCHAR(50) NOT NULL,             -- Type of round
    FOREIGN KEY (applicationId) REFERENCES application(applicationId)
);


CREATE TABLE submits (
    email VARCHAR(255),                        -- Foreign key to user
    applicationId INT,                         -- Foreign key to application
    PRIMARY KEY (email, applicationId),        -- Composite primary key
    FOREIGN KEY (email) REFERENCES [user](email),
    FOREIGN KEY (applicationId) REFERENCES application(applicationId)
);


CREATE TABLE [contains] (
    applicationId INT,                        -- Foreign key to application
    interviewId INT,                          -- Foreign key to interview
    PRIMARY KEY (applicationId, interviewId), -- Composite primary key
    FOREIGN KEY (applicationId) REFERENCES application(applicationId),
    FOREIGN KEY (interviewId) REFERENCES interview(interviewId)
);

CREATE TABLE locatedAt (
    companyId INT NOT NULL,
    jobId INT NOT NULL,
    PRIMARY KEY (companyId, jobId),
    FOREIGN KEY (companyId) REFERENCES company(companyId),
    FOREIGN KEY (jobId) REFERENCES job(jobId)
);