USE ClassProject;
GO

-- Question 2

-- Constraint 1
ALTER TABLE internship
ADD CONSTRAINT chk_internship_dates
CHECK (endDate > startDate);

-- Constraint 2
ALTER TABLE internship
ADD CONSTRAINT chk_internship_hourlyPay
CHECK (hourlyPay >= 0);

-- Constraint 3
ALTER TABLE application
ADD CONSTRAINT chk_application_status
CHECK (status IN ('Submitted', 'Interviewing', 'Offered', 'Rejected', 'Accepted', 'Withdrawn'));


