# Sample return from pgAdmin
#"marketing";330
#"sales";325
#"technical";345

SELECT department, COUNT(*) FROM requests
GROUP BY department
ORDER BY department;
