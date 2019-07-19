CREATE OR REPLACE PACKAGE pkg_user_mgmt
/***************************************************
Created By: Nayeem Syed
Created Date: 09/19/2010
Description: Schema Creation Pacakege. This will standardise the proces of Schema creation accross all the database enviornments.
Modifiaction History:
      Modified By: Nayeem Syed
      Modified Date: 09/10/2019
      Description: Added User Creation Feature
****************************************************/
AS
PROCEDURE schema_create(p_schema_name VARCHAR2, p_password VARCHAR2, p_default_tablespace VARCHAR2 DEFAULT 'USERS', p_temp_tablespace VARCHAR2 DEFAULT 'TEMP');
PROCEDURE user_create(p_username VARCHAR2, p_password VARCHAR2, p_resource1 VARCHAR2 DEFAULT NULL, p_resource2 VARCHAR2 DEFAULT NULL,  p_resource3 VARCHAR2 DEFAULT NULL);
PROCEDURE lock_user(p_username VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_user_mgmt 
IS 

/*Create Schema*/

PROCEDURE schema_create(p_schema_name VARCHAR2, p_password VARCHAR2, p_default_tablespace VARCHAR2 DEFAULT 'USERS', p_temp_tablespace VARCHAR2 DEFAULT 'TEMP')
IS 
v_stmt varchar2(2000);
BEGIN 
v_stmt := 'CREATE '||p_schema_name|| ' identified by ' || p_password || ';';
EXECUTE IMMEDIATE v_stmt;
DBMS_OUTPUT.PUT_LINE(v_stmt|| ' - Schema CREATED SUCCESSFULLY');
END schema_create;  -- End Schema Create Procedure


/* Create User */

PROCEDURE user_create(p_username VARCHAR2, p_password VARCHAR2, p_resource1 VARCHAR2 DEFAULT NULL, p_resource2 VARCHAR2 DEFAULT NULL,  p_resource3 VARCHAR2 DEFAULT NULL)
IS
v_stmt varchar2(2000);
BEGIN
v_stmt := 'CREATE USER '||p_username|| ' identified by ' || p_password || ';';
EXECUTE IMMEDIATE v_stmt;
DBMS_OUTPUT.PUT_LINE(v_stmt|| ' - User CREATED SUCCESSFULLY');
END user_create; -- End User Create Procedure

/* Lock User */

PROCEDURE lock_user(p_username VARCHAR2)
IS
v_stmt varchar2(2000);
BEGIN
v_stmt := 'ALTER USER '||p_username|| ' ACCOUNT LOCK;';
EXECUTE IMMEDIATE v_stmt;
DBMS_OUTPUT.PUT_LINE(v_stmt|| ' - User CREATED SUCCESSFULLY');
END lock_user;

END pkg_user_mgmt;
/