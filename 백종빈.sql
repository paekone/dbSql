
SELECT r.region_id, r.region_name, c.country_name
FROM countries c 
JOIN regions r ON (c.region_id=r.region_id) WHERE r.region_id = 1;


SELECT r.region_id, r.region_name, c.country_name, l.city--, l.location_id
FROM countries c 
JOIN regions r ON (c.region_id=r.region_id) 
JOIN locations l ON(c.country_id=l.country_id) WHERE r.region_id = 1;


SELECT r.region_id, r.region_name, c.country_name, l.city, d.department_name, l.location_id
FROM countries c 
JOIN regions r ON (c.region_id=r.region_id) 
JOIN locations l ON(c.country_id=l.country_id) 
JOIN departments d ON(l.location_id=d.location_id)
WHERE r.region_id = 1;


SELECT r.region_id, r.region_name, c.country_name, l.city, d.department_name, l.location_id
FROM countries c 
JOIN regions r ON (c.region_id=r.region_id) 
JOIN locations l ON(c.country_id=l.country_id) 
JOIN departments d ON(l.location_id=d.location_id)
JOIN employees e ON(d.department_id=e.department_id)
WHERE r.region_id = 1;

SELECT e.employee_id, (e.first_name||e.last_name) name, j.job_id, j.job_title FROM employees e JOIN jobs j ON(e.job_id=j.job_id);

SELECT e2.manager_id,(e.first_name||e.last_name) mgr_name,e2.employee_id, (e2.first_name||e2.last_name) name, j.job_id, j.job_title
FROM employees e 
JOIN employees e2 ON(e.employee_id=e2.manager_id)
JOIN jobs j ON(e2.job_id=j.job_id);

SELECT * FROM regions;
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;


