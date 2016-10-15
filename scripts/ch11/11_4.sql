BEGIN
  DBMS_AUTO_SQLTUNE.SET_AUTO_TUNING_TASK_PARAMETER(
    parameter => 'ACCEPT_SQL_PROFILES', value => 'TRUE');
END;
/

SELECT parameter_name, parameter_value
FROM dba_advisor_parameters
WHERE task_name = 'SYS_AUTO_SQL_TUNING_TASK'
AND  parameter_name ='ACCEPT_SQL_PROFILES';

BEGIN
  DBMS_AUTO_SQLTUNE.SET_AUTO_TUNING_TASK_PARAMETER(
    parameter => 'ACCEPT_SQL_PROFILES', value => 'FALSE');
END;
/

SELECT parameter_name ,parameter_value
FROM dba_advisor_parameters
WHERE task_name = 'SYS_AUTO_SQL_TUNING_TASK'
AND  parameter_name IN ('ACCEPT_SQL_PROFILES',
                        'MAX_SQL_PROFILES_PER_EXEC',
                        'MAX_AUTO_SQL_PROFILES',
                        'EXECUTION_DAYS_TO_EXPIRE');






