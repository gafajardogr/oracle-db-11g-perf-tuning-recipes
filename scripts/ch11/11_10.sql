BEGIN
  dbms_sqltune.create_sqlset(
    sqlset_name => 'IO_STS'
   description => 'STS from AWR');
END;
/

SNAP_ID from DBA_HIST_SNAPSHOTS:
select snap_id, begin_interval_time
from dba_hist_snapshot order by 1;

DECLARE
  base_cur dbms_sqltune.sqlset_cursor;
BEGIN
  OPEN base_cur FOR
    SELECT value(x)
    FROM table(dbms_sqltune.select_workload_repository(
      26800,26900, null, null,'disk_reads',
      null, null, null, 15)) x;
  --
  dbms_sqltune.load_sqlset(
    sqlset_name => 'IO_STS',
    populate_cursor => base_cur);
END;
/

SELECT
 sqlset_name
,elapsed_time
,cpu_time
,buffer_gets
,disk_reads
,sql_text
FROM dba_sqlset_statements
WHERE sqlset_name = 'IO_STS';





