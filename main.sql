-- Create a table to store employee data
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  job_title VARCHAR(255),
  salary DECIMAL(10,2)
);

-- Insert some sample data into the table
INSERT INTO employees (employee_id, first_name, last_name, job_title, salary)
VALUES (1, 'John', 'Doe', 'Manager', 75000.00),
       (2, 'Jane', 'Doe', 'Developer', 65000.00),
       (3, 'Bob', 'Smith', 'Designer', 60000.00);

-- Create a table to store payroll data
CREATE TABLE payroll (
  payroll_id INT PRIMARY KEY,
  employee_id INT,
  pay_period_start DATE,
  pay_period_end DATE,
  hours_worked DECIMAL(5,2),
  overtime_hours DECIMAL(5,2),
  overtime_rate DECIMAL(5,2),
  gross_pay DECIMAL(10,2),
  deductions DECIMAL(10,2),
  net_pay DECIMAL(10,2),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert some sample data into the payroll table
INSERT INTO payroll (payroll_id, employee_id, pay_period_start, pay_period_end, hours_worked, overtime_hours, overtime_rate, gross_pay, deductions, net_pay)
VALUES (1, 1, '2022-01-01', '2022-01-15', 80, 10, 1.5, 8000.00, 1000.00, 7000.00),
       (2, 2, '2022-01-16', '2022-01-31', 80, 10, 1.5, 8000.00, 1000.00, 7000.00),
       (3, 3, '2022-02-01', '2022-02-15', 80, 10, 1.5, 8000.00, 1000.00, 7000.00);

-- Calculate the total pay for each employee for a given pay period
SELECT e.first_name, e.last_name, SUM(p.gross_pay) as total_pay
FROM employees e
JOIN payroll p ON e.employee_id = p.employee_id
WHERE p.pay_period_start = '2022-01-01' AND p.pay_period_end = '2022-01-15'
GROUP BY e.employee_id;
