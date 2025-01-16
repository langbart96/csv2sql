DROP TABLE IF EXISTS Test_part1;

CREATE TABLE Test_part1 (
    id SERIAL PRIMARY KEY,
    id VARCHAR(2),
    name VARCHAR(21),
    age VARCHAR(2),
    city VARCHAR(12),
    country VARCHAR(3),
    email VARCHAR(26),
    phone VARCHAR(10),
    job VARCHAR(15),
    company VARCHAR(23),
    department VARCHAR(15),
    start_date VARCHAR(10),
    end_date VARCHAR(10),
    remarks VARCHAR(31)
);

INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (1, '1', 'John Doe', '28', 'New York', 'USA', 'john.doe@example.com', '1234567890', 'Engineer', 'TechCorp', 'Engineering', '2020-01-15', '', 'Promoted last year');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (2, '2', 'Jane Smith', '34', 'Los Angeles', 'USA', 'jane.smith@example.com', '9876543210', 'Manager', 'SalesInc', 'Sales', '2018-03-01', '', 'Award-winning performance');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (3, '3', 'Bob Johnson', '45', 'Chicago', 'USA', 'bob.johnson@example.com', '5551234567', 'Analyst', 'DataCorp', 'Research', '2015-07-10', '', 'Top analyst for 3 years');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (4, '4', 'Alice Brown', '25', 'Houston', 'USA', 'alice.brown@example.com', '4445556666', 'Designer', 'CreativeCo', 'Design', '2021-10-25', '', 'New hire');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (5, '5', 'Chris Wilson', '30', 'Philadelphia', 'USA', 'chris.wilson@example.com', '3334445555', 'Developer', 'CodeBase', 'Development', '2017-02-11', '', 'Team lead');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (6, '6', 'Emily Davis', '22', 'Phoenix', 'USA', 'emily.davis@example.com', '1112223333', 'Intern', 'TechCorp', 'Engineering', '2023-06-01', '2023-12-31', 'Internship completed');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (7, '7', 'Michael Taylor', '40', 'San Antonio', 'USA', 'michael.taylor@example.com', '7778889999', 'Director', 'SalesInc', 'Management', '2012-09-15', '', 'Regional director');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (8, '8', 'Sarah Moore', '35', 'San Diego', 'USA', 'sarah.moore@example.com', '8887776666', 'HR Specialist', 'PeopleCo', 'Human Resources', '2019-04-20', '', 'Key recruiter');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (9, '9', 'David White', '29', 'Dallas', 'USA', 'david.white@example.com', '2223334444', 'Marketer', 'BrandInc', 'Marketing', '2016-11-05', '', 'Strong campaign leader');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (10, '10', 'Laura Clark', '33', 'San Jose', 'USA', 'laura.clark@example.com', '9998887777', 'Consultant', 'AdvisoryGroup', 'Consulting', '2014-05-17', '', 'Advisor to multiple teams');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (11, '11', 'James King', '50', 'Seattle', 'USA', 'james.king@example.com', '1231231234', 'Executive', 'BigCorp', 'Executive', '2008-01-01', '', 'CEO');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (12, '12', 'Incomplete Row', '38', 'Boston', 'USA', '', '1234567890', '', '', '', '', '', 'Missing email');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (13, '13', 'Extra Column', '26', 'Portland', 'USA', 'extra@example.com', '0000000000', 'Developer', 'CodeBase', 'Development', '2019-03-15', '', 'Extra data column');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (14, '14', 'John Q. Public', '48', 'Miami', 'USA', 'john.public@example.com', '4443332222', 'Researcher', 'LabTech', 'Science', '2010-08-12', '', 'Patent holder');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (15, '15', 'Angela Perez', '29', 'Austin', 'USA', 'angela.perez@example.com', '5556667777', 'Product Manager', 'InnovateX', 'Product', '2016-05-09', '', 'Led successful product launches');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (16, '16', 'William Evans', '55', 'Denver', 'USA', 'william.evans@example.com', '6667778888', 'Professor', 'University of Knowledge', 'Academia', '2000-02-29', '', 'Author of multiple textbooks');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (17, '17', 'Nancy Drew', '39', 'Las Vegas', 'USA', 'nancy.drew@example.com', '1233211234', 'Investigator', 'Detective Agency', 'Investigations', '2011-07-04', '', 'Solves complex cases');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (18, '18', 'Kate Black', '41', 'Detroit', 'USA', 'kate.black@example.com', '3211233210', 'Mechanic', 'AutoFix', 'Repairs', '2007-11-11', '', 'Top technician');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (19, '19', 'Henry Ford', '60', 'Dearborn', 'USA', 'henry.ford@example.com', '9990001111', 'Engineer', 'AutoMotive', 'Design', '1995-01-01', '', 'Industry pioneer');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (20, '20', 'Melissa Green', '27', 'Orlando', 'USA', 'melissa.green@example.com', '5554443333', 'Content Writer', 'MediaHouse', 'Content', '2022-01-15', '', 'Focuses on digital trends');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (21, '21', 'Row With Missing Data', '', '', '', '', '', '', '', '', '', '', '', 'Some values missing');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (22, '22', 'Row With Excess Data', '23', 'Columbus', 'USA', 'extra.row@example.com', '9879879876', 'Writer', 'WordsCo', 'Writing', '2021-09-01', '', 'Extra column', 'Unexpected value');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (23, '23', 'Short Row', '40', '', '', '', '', '', '', '', '', '', 'Shortened data row');
INSERT INTO Test_part1 (id, id, name, age, city, country, email, phone, job, company, department, start_date, end_date, remarks) VALUES (24, '24', 'Excess Columns', '30', 'Atlanta', 'USA', 'extra@example.com', '1111111111', 'Developer', 'CodeBase', 'IT', '2020-02-01', '', 'Extra', 'value', 'columns');
