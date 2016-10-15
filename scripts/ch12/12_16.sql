BEGIN
  DBMS_SPM.CREATE_STGTAB_BASELINE(table_name => 'exp_pb');
END;
/


DECLARE
  pbs NUMBER;
BEGIN
  pbs := DBMS_SPM.PACK_STGTAB_BASELINE(
           table_name => 'exp_pb',
           enabled => 'yes',
           creator => 'MV_MAINT');
END;
/

DECLARE
  pbs NUMBER;
BEGIN
  pbs := DBMS_SPM.UNPACK_STGTAB_BASELINE(
           table_name => 'exp_pb',
           enabled => 'yes');
END;
/
