/*
Ticket 1: Setup the Healthcare System Database

Tasks:

To set up the database, you can use the SQL script provided below:
*/
USE healthcaresystemdb;
/*
Ticket 2: Basic SELECT and WHERE Clause

Description: Practice using the SELECT statement with the WHERE clause to filter data.

Tasks:

List all patients who are female.
Filter the Patients table to retrieve entries where Gender is 'Female'.
Retrieve all appointments that are scheduled but not yet completed.
Use the Status field in the Appointments table to identify scheduled appointments.
Find all doctors who specialize in "Internal Medicine".
Query the Doctors table based on the Specialization field.
List all patients born after January 1, 1985.
Compare the DateOfBirth field in the Patients table to filter results.
Retrieve all medical records where the diagnosis includes the word "Cold".
Use pattern matching on the Diagnosis field in the MedicalRecords table.
*/
SELECT * FROM patients WHERE Gender = 'FEMALE';

select * from appointments where status != 'completed';

select * from doctors where Specialization = 'internal medicine';

select * from patients  where DateOfBirth > '19850101';  /*successful YYYYMMDD*/

select * from medicalrecords where Diagnosis like '%cold%';

-- ticket three
/*
Ticket 3: ORDER BY Clause

Description: Practice sorting data using the ORDER BY clause.

Tasks:

List all patients sorted by their last name in ascending order.
Sort the Patients table by the LastName field.
Retrieve all doctors sorted by their specialization in descending order.
Sort the Doctors table by the Specialization field in descending order.
Get all appointments sorted by AppointmentDate in descending order.
Use the ORDER BY clause to sort the Appointments table by AppointmentDate.
List all departments sorted by DepartmentName in ascending order.
Sort the Departments table alphabetically by the DepartmentName.
Retrieve all bills sorted by BalanceAmount in descending order.
Order the Billing table based on BalanceAmount.
*/
select * from patients order by LastName;

select * from doctors order by Specialization desc;

select * from appointments order by AppointmentDate desc;

select * from departments order by DepartmentName;

select * from billing order by BalanceAmount desc;

-- TICKET 4
/*
Ticket 4: GROUP BY and HAVING Clauses

Description: Practice grouping data and filtering groups using GROUP BY and HAVING clauses.

Tasks:

Count the number of patients per country.
Group the Patients table by Country and count the total for each group.
Find the total number of appointments per doctor.
Group the Appointments table by DoctorID and count the appointments.
Retrieve the total amount billed per patient.
Group the Billing table by PatientID and sum the TotalAmount for each patient.
Get the number of appointments each doctor has scheduled, but only show doctors with more than 1 scheduled appointment.
Use GROUP BY and filter the results with HAVING to show only those with more than 1 scheduled appointment.
*/
select country, count(Country) as total from patients group by country;

select * from appointments;

select doctorid, count(doctorid) as total from appointments group by DoctorID;

select * from billing;

select patientid, sum(totalamount) from billing group by patientid;

select * from appointments;

select DoctorID, count(DoctorID) as total_appointment from appointments group by DoctorID having count(DoctorID) > 1;

-- ticket 5

/*
Ticket 5: LIKE Operator

Description: Practice pattern matching using the LIKE operator.

Tasks:

Find all patients whose first name starts with "J".
Use the LIKE operator with a wildcard to find matching FirstName entries in the Patients table.
Retrieve all doctors whose last name contains "son".
Use the LIKE operator to search for patterns in the LastName field of the Doctors table.
List all departments whose name ends with "y".
Match the ending characters of the DepartmentName using the LIKE operator.
Find all medical records where the diagnosis contains "Hypertension".
Use the LIKE operator to search within the Diagnosis field of the MedicalRecords table.
Retrieve all patients whose email domain is "example.com".
Use the LIKE operator to match the email domain in the Email field of the Patients table.
*/

select * from patients where FirstName like 'j%';

select * from doctors where LastName like '%son%';

select * from departments where DepartmentName like '%y';

select * from medicalrecords where Diagnosis like '%hypertension%';

select * from patients where Email like '%example.com';

-- ticket 6

/*
Ticket 6: BETWEEN Operator

Description: Practice filtering data within a range using the BETWEEN operator.

Tasks:

List all appointments scheduled between '2023-07-01' and '2023-07-03'.
Use the BETWEEN operator to filter appointments by date.
Find all patients born between '1980-01-01' and '1990-12-31'.
Filter the Patients table using BETWEEN on the DateOfBirth field.
Retrieve all bills with a TotalAmount between $100 and $500.
Use BETWEEN to filter the Billing table by TotalAmount.
Get all appointments scheduled within the next 7 days (assume today is '2023-07-01').
Use BETWEEN with the AppointmentDate to find appointments within this date range.
*/

select * from appointments where AppointmentDate between '2023-07-01' and '2023-07-03';

select * from patients where DateOfBirth between '1980-01-01' and '1990-12-31';

select * from billing where TotalAmount between 100 and 500;

select * from appointments where AppointmentDate between '2023-07-01' and date_add('2023-07-01', interval 7 day);

-- ticket 7
/*
Ticket 7: LIMIT Operator

Description: Practice limiting the number of rows returned using the LIMIT operator.

Tasks:

Retrieve the first 5 patients sorted by LastName.
Sort the Patients table by LastName and use LIMIT to return only the first 5 entries.
Get the top 3 most expensive bills.
Sort the Billing table by TotalAmount in descending order and limit the results to the top 3.
List the first 10 appointments scheduled.
Order the Appointments table by AppointmentDate and limit the results to the first 10 entries.
Retrieve the first 5 doctors sorted by FirstName.
Sort the Doctors table by FirstName and use LIMIT to retrieve the top 5.
Find the top 5 patients with the highest balance amount.
Sort the Billing table by BalanceAmount in descending order and use LIMIT to show the top 5 results.
*/
select * from patients order by LastName limit 5;

select * from billing order by TotalAmount desc limit 3;

select * from appointments order by AppointmentDate limit 10;

select * from doctors order by FirstName limit 5;

select * from billing order by BalanceAmount desc limit 5;

-- ticket 8

/*
Ticket 8: Chaining SQL Clauses

Description: Practice combining multiple SQL clauses to form complex queries.

Tasks:

Retrieve the first 3 patients sorted by LastName who are female and live in the USA.
Combine WHERE, ORDER BY, and LIMIT clauses to filter, sort, and limit the results.
Find the total number of appointments per doctor, but only show doctors who have scheduled more than 2 appointments. Sort the results by the total number of appointments in descending order.
Use GROUP BY, HAVING, and ORDER BY clauses to achieve the desired result.
List all patients whose last name starts with "S", who were born after 1985, and sort them by DateOfBirth in ascending order.
Combine WHERE, LIKE, and ORDER BY clauses for filtering and sorting.
Retrieve the total amount billed per patient for those whose total billed amount is between $200 and $1500. Only show patients who have made more than 2 appointments.
Use GROUP BY, HAVING, and BETWEEN to filter and aggregate the data.
*/

select * from patients where Gender = 'female' and Country = 'usa' order by LastName limit 3;

select doctorid, count(doctorid) from appointments group by DoctorID having count(DoctorID) > 1 order by DoctorID desc; 

select * from appointments;

select * from patients where LastName like 's%' and DateOfBirth > '1985-12-31' order by DateOfBirth;

select * from billing;
select PatientID, count(AppointmentID) as num_appointments from billing where TotalAmount between 200 and 1500 group by BillID having num_appointments > 2 order by num_appointments desc;