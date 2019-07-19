
CREATE OR REPLACE PACKAGE pkg_user_mgmt
/***************************************************
Created By: Nayeem Syed
Created Date: 09/19/2010
Description: Schema Creation Pacakege. This will standardise the proces of Schema creation accross all the database enviornments.
****************************************************/
AS
PROCEDURE schema_create(p_schema_name VARCHAR2, p_password VARCHAR2, p_default_tablespace VARCHAR2, p_temp_tablespace VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_user_mgmt 
IS 
PROCEDURE schema_create(p_schema_name VARCHAR2, p_password VARCHAR2, p_default_tablespace VARCHAR2, p_temp_tablespace VARCHAR2)
IS 
v_stmt varchar2(2000);
BEGIN 
v_stmt := 'CREATE '||p_schema_name|| ' identified by ' || p_password || ';';
EXECUTE IMMEDIATE v_stmt;
DBMS_OUTPUT.PUT_LINE(v_stmt|| ' - CREATED SUCCESSFULLY');
NULL;
END schema_create;
END pkg_user_mgmt;
/
