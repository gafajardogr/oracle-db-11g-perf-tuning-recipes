select sqlset_name, disk_reads, cpu_time, elapsed_time, buffer_gets
from dba_sqlset_statements;

BEGIN
  DBMS_SQLTUNE.DELETE_SQLSET(
    sqlset_name  => 'IO_STS'
   ,basic_filter => 'disk_reads < 2000000');
END;
/




