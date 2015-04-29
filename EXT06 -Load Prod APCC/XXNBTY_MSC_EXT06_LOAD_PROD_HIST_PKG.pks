create or replace PACKAGE        "XXNBTY_MSCEXT06_LOAD_HIST_PKG" 
--------------------------------------------------------------------------------------------
/*
  Package Name: XXNBTY_MSCEXT06_LOAD_HIST_PKG
  Author's Name: Erwin Ramos
  Date written: 01-Mar-2015
  RICEFW Object: EXT06
  Description: Package body of MSC Load production history in APCC 
  Program Style: 
  Maintenance History:

Date			Issue#		Name					Remarks	
-----------		------		-----------				------------------------------------------------
01-Mar-2015					Erwin Ramos				Initial creation

*/
--------------------------------------------------------------------------------------------
IS
  PROCEDURE submit_Import_Plan_Summary (x_retcode   OUT VARCHAR2, 
                            x_errbuf    OUT VARCHAR2,
							--p_target_plan_name VARCHAR2,
							p_directory 	   VARCHAR2,
							p_instance_code    VARCHAR2
							--p_org_code 		   VARCHAR2
							--p_plan_start_date  VARCHAR2,
							--p_plan_cutoff_date VARCHAR2 
                           ); 
END XXNBTY_MSCEXT06_LOAD_HIST_PKG;
/
show errors;
