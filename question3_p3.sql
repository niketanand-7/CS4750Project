USE ClassProjectV2;
GO

-- Quesiton 3


INSERT INTO [user] (email, name, classYear)
VALUES
('alice.smith@example.com', 'Alice Smith', 2024),
('bob.johnson@example.com', 'Bob Johnson', 2023),
('carol.williams@example.com', 'Carol Williams', 2025),
('dave.brown@example.com', 'Dave Brown', 2024),
('eva.jones@example.com', 'Eva Jones', 2023),
('frank.miller@example.com', 'Frank Miller', 2025),
('grace.davis@example.com', 'Grace Davis', 2024),
('henry.garcia@example.com', 'Henry Garcia', 2023),
('irene.martinez@example.com', 'Irene Martinez', 2025),
('jack.taylor@example.com', 'Jack Taylor', 2024),
('karen.anderson@example.com', 'Karen Anderson', 2023),
('leo.thomas@example.com', 'Leo Thomas', 2025),
('mary.moore@example.com', 'Mary Moore', 2024),
('nathan.jackson@example.com', 'Nathan Jackson', 2023),
('olivia.white@example.com', 'Olivia White', 2025),
('peter.harris@example.com', 'Peter Harris', 2024),
('queen.lewis@example.com', 'Queen Lewis', 2023),
('robert.clark@example.com', 'Robert Clark', 2025),
('susan.robinson@example.com', 'Susan Robinson', 2024),
('timothy.walker@example.com', 'Timothy Walker', 2023),
('ursula.young@example.com', 'Ursula Young', 2025),
('victor.king@example.com', 'Victor King', 2024),
('wendy.wright@example.com', 'Wendy Wright', 2023),
('xavier.lopez@example.com', 'Xavier Lopez', 2025),
('yvonne.hill@example.com', 'Yvonne Hill', 2024),
('zachary.scott@example.com', 'Zachary Scott', 2023),
('amelia.green@example.com', 'Amelia Green', 2025),
('brian.adams@example.com', 'Brian Adams', 2024),
('claire.baker@example.com', 'Claire Baker', 2023),
('daniel.gonzalez@example.com', 'Daniel Gonzalez', 2025),
('emma.nelson@example.com', 'Emma Nelson', 2024),
('fred.carter@example.com', 'Fred Carter', 2023),
('gina.mitchell@example.com', 'Gina Mitchell', 2025),
('harry.perez@example.com', 'Harry Perez', 2024),
('isabella.roberts@example.com', 'Isabella Roberts', 2023);


INSERT INTO user_major (email, major)
VALUES
('alice.smith@example.com', 'Computer Science, Mathematics'),
('bob.johnson@example.com', 'Data Science, English'),
('carol.williams@example.com', 'Finance'),
('dave.brown@example.com', 'Education'),
('eva.jones@example.com', 'Environmental Science'),
('frank.miller@example.com', 'Mechanical Engineering'),
('grace.davis@example.com', 'Statistics'),
('henry.garcia@example.com', 'Computer Science'),
('irene.martinez@example.com', 'Media Studies'),
('jack.taylor@example.com', 'Computer Sciencet'),
('karen.anderson@example.com', 'Agriculture'),
('leo.thomas@example.com', 'Biomedical Engineering'),
('mary.moore@example.com', 'Computer Science'),
('nathan.jackson@example.com', 'Graphic Design'),
('olivia.white@example.com', 'Civil Engineering'),
('peter.harris@example.com', 'Computer Science'),
('queen.lewis@example.com', 'Game Development'),
('robert.clark@example.com', 'Kinesiology'),
('susan.robinson@example.com', 'Business Administration'),
('timothy.walker@example.com', 'Computer Science'),
('ursula.young@example.com', 'Marketing'),
('victor.king@example.com', 'Computer Science'),
('wendy.wright@example.com', 'Computer Science'),
('xavier.lopez@example.com', 'Computer Science'),
('yvonne.hill@example.com', 'Computer Science'),
('zachary.scott@example.com', 'Mechanical Engineering'),
('amelia.green@example.com', 'Computer Science'),
('brian.adams@example.com', 'Computer Science'),
('claire.baker@example.com', 'Computer Science'),
('daniel.gonzalez@example.com', 'Computer Science'),
('emma.nelson@example.com', 'Computer Science'),
('fred.carter@example.com', 'Finance'),
('gina.mitchell@example.com', 'Computer Science'),
('harry.perez@example.com', 'Computer Science'),
('isabella.roberts@example.com', 'Computer Science');

INSERT INTO company (name, description)
VALUES
('CoStar', 'Commercial real estate data and analytics.'),
('CapTech', 'Consulting and technology solutions.'),
('Deloitte', 'Audit, consulting, and advisory services.'),
('Dell', 'Computers and technology solutions.'),
('BCG', 'Management consulting firm.'),
('Microsoft', 'Software and technology products.'),
('Apple', 'Consumer electronics and software.'),
('Doordash', 'Food delivery service.'),
('Airbnb', 'Vacation rentals and experiences.'),
('Dominion Energy', 'Energy production and distribution.'),
('Palantir Technologies', 'Data analytics and software.'),
('Epic', 'Healthcare software solutions.'),
('Walmart', 'Retail and consumer goods.'),
('Lowes', 'Home improvement and hardware.'),
('Google', 'Search and advertising technology.'),
('Amazon', 'E-commerce and cloud services.'),
('Uber', 'Ride-sharing and delivery service.'),
('Meta', 'Social media and virtual reality.'),
('Tesla', 'Electric vehicles and energy products.'),
('NVIDIA', 'Graphics and AI computing.'),
('Northrop Grumman', 'Aerospace and defense technology.'),
('Lockheed Martin', 'Defense and aerospace technology.'),
('Booz Allen', 'Management and technology consulting.'),
('CGI', 'IT and business consulting.'),
('Leidos', 'Technology and engineering services.'),
('PWC', 'Professional services and consulting.'),
('EY Consulting', 'Audit and consulting services.'),
('FTI Consulting', 'Business advisory services.'),
('WillowTree', 'Mobile app development.'),
('Capital One', 'Financial services and banking.'),
('Accenture', 'Consulting and technology services.'),
('Appian', 'Business process automation software.'),
('Jefferies', 'Investment banking and financial services.'),
('Yext', 'Digital knowledge management.'),
('Salesforce', 'Cloud based architecture solutions.'); 


INSERT INTO job (companyId, jobTitle)
VALUES
(1, 'Software Engineer'),
(2, 'Data Analyst'),
(3, 'Financial Advisor'),
(4, 'Curriculum Developer'),
(5, 'Renewable Energy Engineer'),
(6, 'Autonomous Vehicle Tester'),
(7, 'Logistics Coordinator'),
(8, 'Travel Consultant'),
(9, 'Digital Content Creator'),
(10, 'Project Manager'),
(11, 'Agricultural Technician'),
(12, 'Biomedical Researcher'),
(13, 'Cloud Solutions Architect'),
(14, 'Graphic Designer'),
(15, 'Civil Engineer'),
(16, 'Fashion Merchandiser'),
(17, 'Game Developer'),
(18, 'Fitness Trainer'),
(19, 'Startup Consultant'),
(20, 'Jewelry Designer'),
(21, 'Product Manager'),
(22, 'Supply Chain Analyst'),
(23, 'Marketing Specialist'),
(24, 'Nanotechnology Engineer'),
(25, 'Optical Engineer'),
(26, 'Cybersecurity Analyst'),
(27, 'Maintenance Technician'),
(28, 'Retail Manager'),
(29, 'Solar Installation Technician'),
(30, 'Hardware Engineer'),
(31, 'Restaurant Manager'),
(32, 'Bank Teller'),
(33, 'Web Developer'),
(34, 'Pharmacologist'),
(35, 'Sports Coach'),
(1, 'Backend Developer'),
(2, 'Business Analyst'),
(3, 'Investment Banker'),
(4, 'Instructional Designer'),
(5, 'Environmental Scientist'),
(6, 'Mechanical Engineer'),
(7, 'Operations Manager'),
(8, 'Tour Guide'),
(9, 'Social Media Manager'),
(10, 'Construction Supervisor'),
(11, 'Farm Manager'),
(12, 'Clinical Trial Coordinator'),
(13, 'Network Engineer'),
(14, 'UX/UI Designer'),
(15, 'Structural Engineer'),
(16, 'Fashion Buyer'),
(17, 'Level Designer'),
(18, 'Nutritionist'),
(19, 'Business Development Manager'),
(20, 'Metalworker'),
(1, 'Frontend Developer'),
(2, 'Data Scientist'),
(3, 'Financial Analyst'),
(4, 'Education Consultant'),
(5, 'Sustainability Specialist'),
(6, 'Electrical Engineer'),
(7, 'Supply Chain Analyst'),
(8, 'Travel Agent'),
(9, 'SEO Specialist'),
(10, 'Site Engineer'),
(11, 'Soil Scientist'),
(12, 'Lab Technician'),
(13, 'Systems Administrator'),
(14, 'Illustrator'),
(15, 'Urban Planner'),
(16, 'Fashion Designer'),
(17, 'Game Tester'),
(18, 'Wellness Coach'),
(19, 'Innovation Strategist'),
(20, 'Gemologist'),
(21, 'Software Engineer'),          
(5, 'Data Scientist'),
(13, 'Financial Analyst'),          
(8, 'Marketing Specialist'),
(27, 'Cybersecurity Analyst'),      
(15, 'Project Manager'),            
(4, 'Software Engineer'),           
(22, 'Business Analyst'),           
(6, 'Mechanical Engineer'),         
(18, 'Fitness Trainer'),            
(30, 'Hardware Engineer'),          
(33, 'Web Developer'),              
(9, 'Digital Content Creator'),     
(24, 'Research Scientist'),         
(12, 'Biomedical Researcher'),      
(16, 'Fashion Designer'),           
(31, 'Chef'),
(26, 'Ethical Hacker'),             
(17, 'Game Developer'),             
(10, 'Site Engineer');              

INSERT INTO job_location (jobId, location)
VALUES
(1, 'New York, NY'),
(2, 'San Francisco, CA'),
(3, 'Chicago, IL'),
(4, 'Boston, MA'),
(5, 'Seattle, WA'),
(6, 'Austin, TX'),
(7, 'Atlanta, GA'),
(8, 'Miami, FL'),
(9, 'Los Angeles, CA'),
(10, 'Portland, OR'),
(11, 'Houston, TX'),
(12, 'Philadelphia, PA'),
(13, 'San Diego, CA'),
(14, 'San Jose, CA'),
(15, 'Phoenix, AZ'),
(16, 'Dallas, TX'),
(17, 'Detroit, MI'),
(18, 'Nashville, TN'),
(19, 'Charlotte, NC'),
(20, 'Indianapolis, IN'),
(21, 'Columbus, OH'),
(22, 'Baltimore, MD'),
(23, 'Las Vegas, NV'),
(24, 'Cincinnati, OH'),
(25, 'Kansas City, MO'),
(26, 'Sacramento, CA'),
(27, 'Orlando, FL'),
(28, 'Cleveland, OH'),
(29, 'Salt Lake City, UT'),
(30, 'Pittsburgh, PA'),
(31, 'San Antonio, TX'),
(32, 'Milwaukee, WI'),
(33, 'Albuquerque, NM'),
(34, 'Tucson, AZ'),
(35, 'Oklahoma City, OK'),
(36, 'New Orleans, LA'),
(37, 'Memphis, TN'),
(38, 'Richmond, VA'),
(39, 'Buffalo, NY'),
(40, 'Raleigh, NC'),
(41, 'Hartford, CT'),
(42, 'Providence, RI'),
(43, 'Louisville, KY'),
(44, 'Omaha, NE'),
(45, 'Birmingham, AL'),
(46, 'Honolulu, HI'),
(47, 'Des Moines, IA'),
(48, 'Boise, ID'),
(49, 'Madison, WI'),
(50, 'Anchorage, AK'),
(51, 'New York, NY'),
(52, 'San Francisco, CA'),
(53, 'Chicago, IL'),
(54, 'Boston, MA'),
(55, 'Seattle, WA'),
(56, 'Austin, TX'),
(57, 'Atlanta, GA'),
(58, 'Miami, FL'),
(59, 'Los Angeles, CA'),
(60, 'Portland, OR'),
(61, 'Houston, TX'),
(62, 'Philadelphia, PA'),
(63, 'San Diego, CA'),
(64, 'San Jose, CA'),
(65, 'Phoenix, AZ'),
(66, 'Dallas, TX'),
(67, 'Detroit, MI'),
(68, 'Nashville, TN'),
(69, 'Charlotte, NC'),
(70, 'Indianapolis, IN'),
(71, 'Columbus, OH'),
(72, 'Baltimore, MD'),
(73, 'Las Vegas, NV'),
(74, 'Cincinnati, OH'),
(75, 'Kansas City, MO'),
(76, 'Sacramento, CA'),
(77, 'Orlando, FL'),
(78, 'Cleveland, OH'),
(79, 'Salt Lake City, UT'),
(80, 'Pittsburgh, PA'),
(81, 'San Antonio, TX'),
(82, 'Milwaukee, WI'),
(83, 'Albuquerque, NM'),
(84, 'Tucson, AZ'),
(85, 'Oklahoma City, OK'),
(86, 'New Orleans, LA'),
(87, 'Memphis, TN'),
(88, 'Richmond, VA'),
(89, 'Buffalo, NY'),
(90, 'Raleigh, NC'),
(91, 'Hartford, CT'),
(92, 'Providence, RI'),
(93, 'Louisville, KY'),
(94, 'Omaha, NE'),
(95, 'Birmingham, AL');


INSERT INTO internship (jobId, hourlyPay, startDate, endDate)
VALUES
(1, 25.00, '2023-06-01', '2023-08-31'),
(2, 22.50, '2023-06-15', '2023-09-15'),
(3, 24.00, '2023-07-01', '2023-10-01'),
(4, 20.00, '2023-05-15', '2023-08-15'),
(5, 23.50, '2023-06-01', '2023-08-31'),
(6, 21.00, '2023-06-15', '2023-09-15'),
(7, 19.50, '2023-07-01', '2023-10-01'),
(8, 18.00, '2023-05-15', '2023-08-15'),
(9, 24.00, '2023-06-01', '2023-08-31'),
(10, 22.00, '2023-06-15', '2023-09-15'),
(11, 20.00, '2023-07-01', '2023-10-01'),
(12, 25.00, '2023-05-15', '2023-08-15'),
(13, 23.00, '2023-06-01', '2023-08-31'),
(14, 21.50, '2023-06-15', '2023-09-15'),
(15, 19.00, '2023-07-01', '2023-10-01'),
(16, 18.50, '2023-05-15', '2023-08-15'),
(17, 24.50, '2023-06-01', '2023-08-31'),
(18, 22.00, '2023-06-15', '2023-09-15'),
(19, 20.50, '2023-07-01', '2023-10-01'),
(20, 25.50, '2023-05-15', '2023-08-15'),
(21, 23.00, '2023-06-01', '2023-08-31'),
(22, 21.00, '2023-06-15', '2023-09-15'),
(23, 19.50, '2023-07-01', '2023-10-01'),
(24, 18.00, '2023-05-15', '2023-08-15'),
(25, 24.00, '2023-06-01', '2023-08-31'),
(26, 22.50, '2023-06-15', '2023-09-15'),
(27, 20.00, '2023-07-01', '2023-10-01'),
(28, 25.00, '2023-05-15', '2023-08-15'),
(29, 23.50, '2023-06-01', '2023-08-31'),
(30, 21.00, '2023-06-15', '2023-09-15'),
(31, 19.50, '2023-07-01', '2023-10-01'),
(32, 18.00, '2023-05-15', '2023-08-15'),
(33, 24.00, '2023-06-01', '2023-08-31'),
(34, 22.00, '2023-06-15', '2023-09-15'),
(35, 20.00, '2023-07-01', '2023-10-01'),
(36, 25.00, '2023-05-15', '2023-08-15'),
(37, 23.00, '2023-06-01', '2023-08-31'),
(38, 21.50, '2023-06-15', '2023-09-15'),
(39, 19.00, '2023-07-01', '2023-10-01'),
(40, 18.50, '2023-05-15', '2023-08-15'),
(41, 24.50, '2023-06-01', '2023-08-31'),
(42, 22.00, '2023-06-15', '2023-09-15'),
(43, 20.50, '2023-07-01', '2023-10-01'),
(44, 25.50, '2023-05-15', '2023-08-15'),
(45, 23.00, '2023-06-01', '2023-08-31'),
(46, 21.00, '2023-06-15', '2023-09-15'),
(47, 19.50, '2023-07-01', '2023-10-01'),
(48, 18.00, '2023-05-15', '2023-08-15'),
(49, 24.00, '2023-06-01', '2023-08-31'),
(50, 22.50, '2023-06-15', '2023-09-15');


INSERT INTO fullTime (jobId, startDate, salary)
VALUES
(51, '2023-09-01', 85000.00),
(52, '2023-09-15', 90000.00),
(53, '2023-10-01', 75000.00),
(54, '2023-09-01', 80000.00),
(55, '2023-09-15', 95000.00),
(56, '2023-10-01', 70000.00),
(57, '2023-09-01', 78000.00),
(58, '2023-09-15', 85000.00),
(59, '2023-10-01', 92000.00),
(60, '2023-09-01', 65000.00),
(61, '2023-09-15', 87000.00),
(62, '2023-10-01', 81000.00),
(63, '2023-09-01', 83000.00),
(64, '2023-09-15', 88000.00),
(65, '2023-10-01', 79000.00),
(66, '2023-09-01', 76000.00),
(67, '2023-09-15', 84000.00),
(68, '2023-10-01', 90000.00),
(69, '2023-09-01', 82000.00),
(70, '2023-09-15', 86000.00),
(71, '2023-10-01', 75000.00),
(72, '2023-09-01', 83000.00),
(73, '2023-09-15', 88000.00),
(74, '2023-10-01', 79000.00),
(75, '2023-09-01', 76000.00),
(76, '2023-09-15', 84000.00),
(77, '2023-10-01', 90000.00),
(78, '2023-09-01', 82000.00),
(79, '2023-09-15', 86000.00),
(80, '2023-10-01', 75000.00),
(81, '2023-09-01', 83000.00),
(82, '2023-09-15', 88000.00),
(83, '2023-10-01', 79000.00),
(84, '2023-09-01', 76000.00),
(85, '2023-09-15', 84000.00),
(86, '2023-10-01', 90000.00),
(87, '2023-09-01', 82000.00),
(88, '2023-09-15', 86000.00),
(89, '2023-10-01', 75000.00),
(90, '2023-09-01', 83000.00),
(91, '2023-09-15', 88000.00),
(92, '2023-10-01', 79000.00),
(93, '2023-09-01', 76000.00),
(94, '2023-09-15', 84000.00),
(95, '2023-10-01', 90000.00);


INSERT INTO fullTime_benefits (jobId, benefit)
VALUES
-- Job ID 51
(51, 'Health Insurance'),
(51, '401(k) Matching'),
(51, 'Paid Time Off'),

-- Job ID 52
(52, 'Health Insurance'),
(52, 'Stock Options'),
(52, 'Paid Time Off'),

-- Job ID 53
(53, 'Health Insurance'),
(53, 'Dental Insurance'),
(53, 'Vision Insurance'),

-- Job ID 54
(54, 'Life Insurance'),
(54, 'Gym Membership'),
(54, 'Commuter Benefits'),

-- Job ID 55
(55, 'Employee Discount'),
(55, 'Flexible Schedule'),
(55, 'Work From Home'),

-- Job ID 56
(56, 'Paid Parental Leave'),
(56, 'Tuition Reimbursement'),
(56, 'Professional Development'),

-- Job ID 57
(57, 'Employee Stock Purchase Plan'),
(57, 'Relocation Assistance'),
(57, 'Wellness Program'),

-- Job ID 58
(58, 'Health Insurance'),
(58, '401(k) Matching'),
(58, 'Paid Time Off'),

-- Job ID 59
(59, 'Stock Options'),
(59, 'Employee Assistance Program'),
(59, 'Flexible Schedule'),

-- Job ID 60
(60, 'Health Insurance'),
(60, 'Dental Insurance'),
(60, 'Vision Insurance'),

-- Job ID 61
(61, 'Life Insurance'),
(61, 'Gym Membership'),
(61, 'Commuter Benefits'),

-- Job ID 62
(62, 'Employee Discount'),
(62, 'Flexible Schedule'),
(62, 'Work From Home'),

-- Job ID 63
(63, 'Paid Parental Leave'),
(63, 'Tuition Reimbursement'),
(63, 'Professional Development'),

-- Job ID 64
(64, 'Employee Stock Purchase Plan'),
(64, 'Relocation Assistance'),
(64, 'Wellness Program'),

-- Job ID 65
(65, 'Health Insurance'),
(65, '401(k) Matching'),
(65, 'Paid Time Off'),

-- Job ID 66
(66, 'Stock Options'),
(66, 'Employee Assistance Program'),
(66, 'Flexible Schedule'),

-- Job ID 67
(67, 'Health Insurance'),
(67, 'Dental Insurance'),
(67, 'Vision Insurance'),

-- Job ID 68
(68, 'Life Insurance'),
(68, 'Gym Membership'),
(68, 'Commuter Benefits'),

-- Job ID 69
(69, 'Employee Discount'),
(69, 'Flexible Schedule'),
(69, 'Work From Home'),

-- Job ID 70
(70, 'Paid Parental Leave'),
(70, 'Tuition Reimbursement'),
(70, 'Professional Development'),

-- Job ID 71
(71, 'Employee Stock Purchase Plan'),
(71, 'Relocation Assistance'),
(71, 'Wellness Program'),

-- Job ID 72
(72, 'Health Insurance'),
(72, '401(k) Matching'),
(72, 'Paid Time Off'),

-- Job ID 73
(73, 'Stock Options'),
(73, 'Employee Assistance Program'),
(73, 'Flexible Schedule'),

-- Job ID 74
(74, 'Health Insurance'),
(74, 'Dental Insurance'),
(74, 'Vision Insurance'),

-- Job ID 75
(75, 'Life Insurance'),
(75, 'Gym Membership'),
(75, 'Commuter Benefits'),

-- Job ID 76
(76, 'Employee Discount'),
(76, 'Flexible Schedule'),
(76, 'Work From Home'),

-- Job ID 77
(77, 'Paid Parental Leave'),
(77, 'Tuition Reimbursement'),
(77, 'Professional Development'),

-- Job ID 78
(78, 'Employee Stock Purchase Plan'),
(78, 'Relocation Assistance'),
(78, 'Wellness Program'),

-- Job ID 79
(79, 'Health Insurance'),
(79, '401(k) Matching'),
(79, 'Paid Time Off'),

-- Job ID 80
(80, 'Stock Options'),
(80, 'Employee Assistance Program'),
(80, 'Flexible Schedule'),

-- Job ID 81
(81, 'Health Insurance'),
(81, 'Dental Insurance'),
(81, 'Vision Insurance'),

-- Job ID 82
(82, 'Life Insurance'),
(82, 'Gym Membership'),
(82, 'Commuter Benefits'),

-- Job ID 83
(83, 'Employee Discount'),
(83, 'Flexible Schedule'),
(83, 'Work From Home'),

-- Job ID 84
(84, 'Paid Parental Leave'),
(84, 'Tuition Reimbursement'),
(84, 'Professional Development'),

-- Job ID 85
(85, 'Employee Stock Purchase Plan'),
(85, 'Relocation Assistance'),
(85, 'Wellness Program'),

-- Job ID 86
(86, 'Health Insurance'),
(86, '401(k) Matching'),
(86, 'Paid Time Off'),

-- Job ID 87
(87, 'Stock Options'),
(87, 'Employee Assistance Program'),
(87, 'Flexible Schedule'),

-- Job ID 88
(88, 'Health Insurance'),
(88, 'Dental Insurance'),
(88, 'Vision Insurance'),

-- Job ID 89
(89, 'Life Insurance'),
(89, 'Gym Membership'),
(89, 'Commuter Benefits'),

-- Job ID 90
(90, 'Employee Discount'),
(90, 'Flexible Schedule'),
(90, 'Work From Home'),

-- Job ID 91
(91, 'Paid Parental Leave'),
(91, 'Tuition Reimbursement'),
(91, 'Professional Development'),

-- Job ID 92
(92, 'Employee Stock Purchase Plan'),
(92, 'Relocation Assistance'),
(92, 'Wellness Program'),

-- Job ID 93
(93, 'Health Insurance'),
(93, '401(k) Matching'),
(93, 'Paid Time Off'),

-- Job ID 94
(94, 'Stock Options'),
(94, 'Employee Assistance Program'),
(94, 'Flexible Schedule'),

-- Job ID 95
(95, 'Health Insurance'),
(95, 'Dental Insurance'),
(95, 'Vision Insurance');


INSERT INTO application (email, jobId, status, additionalNotes, createdDate)
VALUES
-- User: alice.smith@example.com
('alice.smith@example.com', 1, 'Submitted', 'Looking forward to this opportunity.', '2023-04-15'),
('alice.smith@example.com', 36, 'Interviewing', 'Had a phone screening.', '2023-04-20'),
('alice.smith@example.com', 56, 'Submitted', NULL, '2023-04-25'),

-- User: bob.johnson@example.com
('bob.johnson@example.com', 2, 'Submitted', NULL, '2023-04-16'),
('bob.johnson@example.com', 37, 'Interviewing', NULL, '2023-04-22'),
('bob.johnson@example.com', 57, 'Submitted', NULL, '2023-04-28'),

-- User: carol.williams@example.com
('carol.williams@example.com', 3, 'Offered', NULL, '2023-04-17'),
('carol.williams@example.com', 38, 'Rejected', NULL, '2023-04-23'),
('carol.williams@example.com', 58, 'Submitted', NULL, '2023-04-29'),

-- User: dave.brown@example.com
('dave.brown@example.com', 4, 'Submitted', 'Excited about this role.', '2023-04-18'),
('dave.brown@example.com', 59, 'Submitted', NULL, '2023-04-24'),

-- User: eva.jones@example.com
('eva.jones@example.com', 5, 'Interviewing', NULL, '2023-04-19'),
('eva.jones@example.com', 40, 'Submitted', NULL, '2023-04-25'),
('eva.jones@example.com', 60, 'Submitted', NULL, '2023-05-01'),

-- User: frank.miller@example.com
('frank.miller@example.com', 6, 'Submitted', NULL, '2023-04-20'),
('frank.miller@example.com', 61, 'Interviewing', NULL, '2023-04-26'),

-- User: grace.davis@example.com
('grace.davis@example.com', 7, 'Rejected', NULL, '2023-04-21'),
('grace.davis@example.com', 42, 'Submitted', NULL, '2023-04-27'),
('grace.davis@example.com', 62, 'Submitted', NULL, '2023-05-03'),

-- User: henry.garcia@example.com
('henry.garcia@example.com', 8, 'Interviewing', NULL, '2023-04-22'),
('henry.garcia@example.com', 43, 'Submitted', NULL, '2023-04-28'),
('henry.garcia@example.com', 63, 'Submitted', NULL, '2023-05-04'),

-- User: irene.martinez@example.com
('irene.martinez@example.com', 9, 'Submitted', NULL, '2023-04-23'),
('irene.martinez@example.com', 64, 'Submitted', NULL, '2023-04-29'),

-- User: jack.taylor@example.com
('jack.taylor@example.com', 10, 'Offered', NULL, '2023-04-24'),
('jack.taylor@example.com', 65, 'Submitted', NULL, '2023-04-30'),

-- User: karen.anderson@example.com
('karen.anderson@example.com', 11, 'Submitted', 'Looking forward to hearing from you.', '2023-04-25'),
('karen.anderson@example.com', 46, 'Submitted', NULL, '2023-05-01'),
('karen.anderson@example.com', 66, 'Submitted', NULL, '2023-05-07'),

-- User: leo.thomas@example.com
('leo.thomas@example.com', 12, 'Interviewing', NULL, '2023-04-26'),
('leo.thomas@example.com', 47, 'Submitted', NULL, '2023-05-02'),
('leo.thomas@example.com', 67, 'Submitted', NULL, '2023-05-08'),

-- User: mary.moore@example.com
('mary.moore@example.com', 13, 'Submitted', NULL, '2023-04-27'),
('mary.moore@example.com', 48, 'Submitted', NULL, '2023-05-03'),
('mary.moore@example.com', 68, 'Submitted', NULL, '2023-05-09'),

-- User: nathan.jackson@example.com
('nathan.jackson@example.com', 14, 'Rejected', NULL, '2023-04-28'),
('nathan.jackson@example.com', 69, 'Submitted', NULL, '2023-05-04'),

-- User: olivia.white@example.com
('olivia.white@example.com', 15, 'Submitted', NULL, '2023-04-29'),
('olivia.white@example.com', 50, 'Submitted', NULL, '2023-05-05'),
('olivia.white@example.com', 70, 'Submitted', NULL, '2023-05-11'),

-- User: peter.harris@example.com
('peter.harris@example.com', 16, 'Interviewing', NULL, '2023-04-30'),
('peter.harris@example.com', 51, 'Submitted', NULL, '2023-05-06'),

-- User: queen.lewis@example.com
('queen.lewis@example.com', 17, 'Submitted', NULL, '2023-05-01'),
('queen.lewis@example.com', 52, 'Submitted', NULL, '2023-05-07'),

-- User: robert.clark@example.com
('robert.clark@example.com', 18, 'Submitted', NULL, '2023-05-02'),
('robert.clark@example.com', 53, 'Submitted', NULL, '2023-05-08'),
('robert.clark@example.com', 73, 'Submitted', NULL, '2023-05-14'),

-- User: susan.robinson@example.com
('susan.robinson@example.com', 19, 'Offered', NULL, '2023-05-03'),
('susan.robinson@example.com', 54, 'Submitted', NULL, '2023-05-09'),

-- User: timothy.walker@example.com
('timothy.walker@example.com', 20, 'Submitted', NULL, '2023-05-04'),
('timothy.walker@example.com', 55, 'Submitted', NULL, '2023-05-10'),

-- User: ursula.young@example.com
('ursula.young@example.com', 21, 'Interviewing', NULL, '2023-05-05'),
('ursula.young@example.com', 76, 'Submitted', NULL, '2023-05-11'),
('ursula.young@example.com', 71, 'Submitted', NULL, '2023-05-17'),

-- User: victor.king@example.com
('victor.king@example.com', 22, 'Submitted', NULL, '2023-05-06'),
('victor.king@example.com', 83, 'Submitted', NULL, '2023-05-12'),

-- User: wendy.wright@example.com
('wendy.wright@example.com', 23, 'Rejected', NULL, '2023-05-07'),
('wendy.wright@example.com', 79, 'Submitted', NULL, '2023-05-13'),
('wendy.wright@example.com', 91, 'Submitted', NULL, '2023-05-19'),

-- User: xavier.lopez@example.com
('xavier.lopez@example.com', 24, 'Submitted', NULL, '2023-05-08'),
('xavier.lopez@example.com', 89, 'Submitted', NULL, '2023-05-14'),

-- User: yvonne.hill@example.com
('yvonne.hill@example.com', 25, 'Interviewing', NULL, '2023-05-09'),
('yvonne.hill@example.com', 75, 'Submitted', NULL, '2023-05-15'),

-- User: zachary.scott@example.com
('zachary.scott@example.com', 26, 'Submitted', NULL, '2023-05-10'),
('zachary.scott@example.com', 80, 'Submitted', NULL, '2023-05-16'),

-- User: amelia.green@example.com
('amelia.green@example.com', 27, 'Submitted', NULL, '2023-05-11'),
('amelia.green@example.com', 60, 'Submitted', NULL, '2023-05-17'),

-- User: brian.adams@example.com
('brian.adams@example.com', 28, 'Interviewing', NULL, '2023-05-12'),
('brian.adams@example.com', 81, 'Submitted', NULL, '2023-05-18'),
('brian.adams@example.com', 84, 'Submitted', NULL, '2023-05-24'),

-- User: claire.baker@example.com
('claire.baker@example.com', 29, 'Submitted', NULL, '2023-05-13'),
('claire.baker@example.com', 82, 'Submitted', NULL, '2023-05-19'),

-- User: daniel.gonzalez@example.com
('daniel.gonzalez@example.com', 30, 'Offered', NULL, '2023-05-14'),
('daniel.gonzalez@example.com', 86, 'Submitted', NULL, '2023-05-20'),

-- User: emma.nelson@example.com
('emma.nelson@example.com', 31, 'Submitted', NULL, '2023-05-15'),
('emma.nelson@example.com', 92, 'Submitted', NULL, '2023-05-21'),

-- User: fred.carter@example.com
('fred.carter@example.com', 32, 'Rejected', NULL, '2023-05-16'),
('fred.carter@example.com', 85, 'Submitted', NULL, '2023-05-22'),

-- User: gina.mitchell@example.com
('gina.mitchell@example.com', 33, 'Submitted', NULL, '2023-05-17'),
('gina.mitchell@example.com', 87, 'Submitted', NULL, '2023-05-23'),
('gina.mitchell@example.com', 91, 'Submitted', NULL, '2023-05-29'),

-- User: harry.perez@example.com
('harry.perez@example.com', 34, 'Interviewing', NULL, '2023-05-18'),
('harry.perez@example.com', 88, 'Submitted', NULL, '2023-05-24'),

-- User: isabella.roberts@example.com
('isabella.roberts@example.com', 35, 'Submitted', NULL, '2023-05-19'),
('isabella.roberts@example.com', 90, 'Submitted', NULL, '2023-05-25'),
('isabella.roberts@example.com', 95, 'Submitted', NULL, '2023-05-31');



INSERT INTO interview (applicationId, date, round, roundType)
VALUES
-- Bob Johnson's applicationId is 5
(5, '2023-05-20', 1, 'Phone Screen'),
(5, '2023-05-25', 2, 'Technical Interview'),

-- Carol Williams's applicationId is 7
(7, '2023-05-21', 1, 'Technical Interview'),
(7, '2023-05-26', 2, 'HR Interview'),
(7, '2023-05-31', 3, 'Onsite Interview'),

-- Henry Garcia's applicationId is 20
(20, '2023-05-22', 1, 'Phone Screen'),
(20, '2023-05-27', 2, 'Technical Interview'),

-- Mary Moore's applicationId is 33
(33, '2023-05-23', 1, 'Technical Interview'),
(33, '2023-05-28', 2, 'Onsite Interview'),

-- Robert Clark's applicationId is 45
(45, '2023-05-24', 1, 'Phone Screen'),
(45, '2023-05-29', 2, 'Technical Interview'),

-- Wendy Wright's applicationId is 58
(58, '2023-05-25', 1, 'Technical Interview'),
(58, '2023-05-30', 2, 'HR Interview'),

-- Brian Adams's applicationId is 68
(68, '2023-05-26', 1, 'Phone Screen'),
(68, '2023-05-31', 2, 'Technical Interview'),

-- Gina Mitchell's applicationId is 79
(79, '2023-05-27', 1, 'Technical Interview'),
(79, '2023-06-01', 2, 'Onsite Interview'),

-- Harry Perez's applicationId is 82
(82, '2023-05-28', 1, 'Phone Screen'),
(82, '2023-06-02', 2, 'Technical Interview');

INSERT INTO submits (email, applicationId)
VALUES
( 'alice.smith@example.com', 1),
( 'alice.smith@example.com', 2),
( 'alice.smith@example.com', 3),
( 'bob.johnson@example.com', 4),
( 'bob.johnson@example.com', 5),
( 'bob.johnson@example.com', 6),
( 'carol.williams@example.com', 7),
( 'carol.williams@example.com', 8),
( 'carol.williams@example.com', 9),
( 'dave.brown@example.com', 10),
( 'dave.brown@example.com', 11),
( 'eva.jones@example.com', 12),
( 'eva.jones@example.com', 13),
( 'eva.jones@example.com', 14),
( 'frank.miller@example.com', 15),
( 'frank.miller@example.com', 16),
( 'grace.davis@example.com', 17),
( 'grace.davis@example.com', 18),
( 'grace.davis@example.com', 19),
( 'henry.garcia@example.com', 20),
( 'henry.garcia@example.com', 21),
( 'henry.garcia@example.com', 22),
( 'irene.martinez@example.com', 23),
( 'irene.martinez@example.com', 24),
( 'jack.taylor@example.com', 25),
( 'jack.taylor@example.com', 26),
( 'karen.anderson@example.com', 27),
( 'karen.anderson@example.com', 28),
( 'karen.anderson@example.com', 29),
( 'leo.thomas@example.com', 30),
( 'leo.thomas@example.com', 31),
( 'leo.thomas@example.com', 32),
( 'mary.moore@example.com', 33),
( 'mary.moore@example.com', 34),
( 'mary.moore@example.com', 35),
( 'nathan.jackson@example.com', 36),
( 'nathan.jackson@example.com', 37),
( 'olivia.white@example.com', 38),
( 'olivia.white@example.com', 39),
( 'olivia.white@example.com', 40),
( 'peter.harris@example.com', 41),
( 'peter.harris@example.com', 42),
( 'queen.lewis@example.com', 43),
( 'queen.lewis@example.com', 44),
( 'robert.clark@example.com', 45),
( 'robert.clark@example.com', 46),
( 'robert.clark@example.com', 47),
( 'susan.robinson@example.com', 48),
( 'susan.robinson@example.com', 49),
( 'timothy.walker@example.com', 50),
( 'timothy.walker@example.com', 51),
( 'ursula.young@example.com', 52),
( 'ursula.young@example.com', 53),
( 'ursula.young@example.com', 54),
( 'victor.king@example.com', 55),
( 'victor.king@example.com', 56),
( 'wendy.wright@example.com', 57),
( 'wendy.wright@example.com', 58),
( 'wendy.wright@example.com', 59),
( 'xavier.lopez@example.com', 60),
( 'xavier.lopez@example.com', 61),
( 'yvonne.hill@example.com', 62),
( 'yvonne.hill@example.com', 63),
( 'zachary.scott@example.com', 64),
( 'zachary.scott@example.com', 65),
( 'amelia.green@example.com', 66),
( 'amelia.green@example.com', 67),
( 'brian.adams@example.com', 68),
( 'brian.adams@example.com', 69),
( 'brian.adams@example.com', 70),
( 'claire.baker@example.com', 71),
( 'claire.baker@example.com', 72),
( 'daniel.gonzalez@example.com', 73),
( 'daniel.gonzalez@example.com', 74),
( 'emma.nelson@example.com', 75),
( 'emma.nelson@example.com', 76),
( 'fred.carter@example.com', 77),
( 'fred.carter@example.com', 78),
( 'gina.mitchell@example.com', 79),
( 'gina.mitchell@example.com', 80),
( 'gina.mitchell@example.com', 81),
( 'harry.perez@example.com', 82),
( 'harry.perez@example.com', 83),
( 'isabella.roberts@example.com', 84),
( 'isabella.roberts@example.com', 85),
( 'isabella.roberts@example.com', 86);

SELECT * From interview

INSERT INTO [contains] (applicationId, interviewId)
VALUES
-- Bob Johnson's applicationId 5
(5, 1),
(5, 2),

-- Carol Williams's applicationId 7
(7, 4),
(7, 5),
(7, 3),

-- Henry Garcia's applicationId 20
(20, 6),
(20, 7),

-- Mary Moore's applicationId 33
(33, 8),
(33, 9),

-- Robert Clark's applicationId 45
(45, 10),
(45, 11),

-- Wendy Wright's applicationId 58
(58, 12),
(58, 13),

-- Brian Adams's applicationId 68
(68, 14),
(68, 15),

-- Gina Mitchell's applicationId 79
(79, 16),
(79, 17),

-- Harry Perez's applicationId 82
(82, 18),
(82, 19);


INSERT INTO locatedAt (companyId, jobId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(1, 36),
(2, 37),
(3, 38),
(4, 39),
(5, 40),
(6, 41),
(7, 42),
(8, 43),
(9, 44),
(10, 45),
(11, 46),
(12, 47),
(13, 48),
(14, 49),
(15, 50),
(16, 51),
(17, 52),
(18, 53),
(19, 54),
(20, 55),
(1, 56),
(2, 57),
(3, 58),
(4, 59),
(5, 60),
(6, 61),
(7, 62),
(8, 63),
(9, 64),
(10, 65),
(11, 66),
(12, 67),
(13, 68),
(14, 69),
(15, 70),
(16, 71),
(17, 72),
(18, 73),
(19, 74),
(20, 75),
(21, 76),
(5, 77),
(13, 78),
(8, 79),
(27, 80),
(15, 81),
(4, 82),
(22, 83),
(6, 84),
(18, 85),
(30, 86),
(33, 87),
(9, 88),
(24, 89),
(12, 90),
(16, 91),
(31, 92),
(26, 93),
(17, 94),
(10, 95);