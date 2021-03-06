SELECT
 'Segment Advice --------------------------'|| chr(10) ||
 'TABLESPACE_NAME  : ' || tablespace_name   || chr(10) ||
 'SEGMENT_OWNER    : ' || segment_owner     || chr(10) ||
 'SEGMENT_NAME     : ' || segment_name      || chr(10) ||
 'ALLOCATED_SPACE  : ' || allocated_space   || chr(10) ||
 'RECLAIMABLE_SPACE: ' || reclaimable_space || chr(10) ||
 'RECOMMENDATIONS  : ' || recommendations   || chr(10) ||
 'SOLUTION 1       : ' || c1                || chr(10) ||
 'SOLUTION 2       : ' || c2                || chr(10) ||
 'SOLUTION 3       : ' || c3 Advice
FROM
TABLE(dbms_space.asa_recommendations('FALSE', 'FALSE', 'FALSE'));

select
 segments_processed
,end_time
from dba_auto_segadv_summary
order by end_time;

select
 'Task Name        : ' || f.task_name  || chr(10) ||
 'Start Run Time   : ' || TO_CHAR(execution_start, 'dd-mon-yy hh24:mi') || chr (10) ||
 'Segment Name     : ' || o.attr2    || chr(10) ||
 'Segment Type     : ' || o.type       || chr(10) ||
 'Partition Name   : ' || o.attr3      || chr(10) ||
 'Message          : ' || f.message    || chr(10) ||
 'More Info        : ' || f.more_info  || chr(10) ||
 '------------------------------------------------------' Advice
FROM dba_advisor_findings   f
    ,dba_advisor_objects    o
    ,dba_advisor_executions e
WHERE o.task_id   = f.task_id
AND   o.object_id = f.object_id
AND   f.task_id   = e.task_id
AND   e. execution_start > sysdate - 1
AND   e.advisor_name = 'Segment Advisor'
ORDER BY f.task_name;

