SELECT client_name, status, consumer_group, window_group
FROM dba_autotask_client
ORDER BY client_name;

SELECT task_name, status, TO_CHAR(execution_end,'DD-MON-YY HH24:MI')
FROM dba_advisor_executions
WHERE task_name='SYS_AUTO_SQL_TUNING_TASK'
ORDER BY execution_end;


