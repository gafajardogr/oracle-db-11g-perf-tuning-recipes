DECLARE
 pf PLS_INTEGER;
BEGIN
  pf := dbms_spm.alter_sql_plan_baseline(
    plan_name => 'SQL_PLAN_1wskqhvrwf8g60e23be79'
   ,attribute_name => 'fixed'
   ,attribute_value => 'YES');
END;
/

SELECT
 sql_handle, plan_name, enabled, accepted, fixed
FROM dba_sql_plan_baselines;
