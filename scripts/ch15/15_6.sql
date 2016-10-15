CREATE INDEX EMP_COPY_I1 
ON EMP_COPY (HIREDATE)
PARALLEL(DEGREE 4);

ALTER INDEX EMP_COPY_I1 NOPARALLEL;
ALTER INDEX EMP_COPY_I1 PARALLEL(DEGREE 1);
