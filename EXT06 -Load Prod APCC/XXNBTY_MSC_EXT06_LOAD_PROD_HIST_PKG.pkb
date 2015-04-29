create or replace PACKAGE BODY XXNBTY_MSCEXT06_LOAD_HIST_PKG
AS

  --------------------------------------------------------------------------------------------
  /*
  Package Name: XXNBTY_MSCEXT06_LOAD_HIST_PKG
  Author's Name: Erwin Ramos
  Date written: 01-Mar-2015
  RICEFW Object: EXT06
  Description: Package body of MSC Load production history in APCC 
  Program Style: 
  Maintenance History:
  Date         Issue#  Name         		Remarks
  -----------  ------  -----------------	------------------------------------------------
  01-Mar-2015			Erwin Ramos			Initial creation
  */
  --------------------------------------------------------------------------------------------

  PROCEDURE submit_Import_Plan_Summary (x_retcode   OUT VARCHAR2, 
                            x_errbuf    OUT VARCHAR2,
							--p_target_plan_name VARCHAR2,
							p_directory 	   VARCHAR2,
							p_instance_code    VARCHAR2
							--p_org_code 		   VARCHAR2
							--p_plan_start_date  VARCHAR2,
							--p_plan_cutoff_date VARCHAR2 
)
  IS
    v_request_id    NUMBER;
    --v_plan_start_date date := to_date (p_plan_start_date, 'YYYY/MM/DD HH24:MI:SS');
    --v_plan_cutoff_date date := to_date (p_plan_cutoff_date, 'YYYY/MM/DD HH24:MI:SS');
  BEGIN
										   
		v_request_id := fnd_request.submit_request(
									 'MSC', -- application
									 'MSCHUBFI', -- program
									 null, -- description
									 null, -- start_time
									 false, -- sub_request
									 null, -- transfer_id
									 null, -- debug_level
									 null, -- source_plan_id
									 null, -- source_plan_run_id
									 null, -- source_db_link
									 '12.1.3', -- source_version
									 null, --p_target_plan_name, -- 'CSVT01', -- target_plan_name /*03-02-2015 removed as per recommended by Sanjay */
									 null, --'', -- plan_description /*03--2-2015 removed as per recommended by Sanjay */
									 1, -- plan_type (1:ASCP, 4:IO, 6:SNO, 8:SPP, 10:DM, 101:RP) 
									 p_directory, -- '/tmp/apcc', -- directory
									 1, -- upload_mode (1:Append, 2:Replace, 3:Create)/*03-03-2015 removed as per recommended by Sanjay */
									 1, -- include_ods (1:yes also import MSC_DEMANTRA_ODS_F, 2:no)
									 p_instance_code, --'SLC', -- instance_code
									 null, --p_org_code, -- 'SLC:M1', -- organization_code
									 null, --v_plan_start_date, -- '07-JAN-2011', -- plan_start_date /*03-02-2015 removed as per recommended by Sanjay */
									 null, --v_plan_cutoff_date, -- '27-MAR-2011', -- plan_cutoff_date /*03-02-2015 removed as per recommended by Sanjay */
									 null, -- overwrite_after_01
									 null, -- overwrite_after_02
									 null, -- overwrite_after_03
									 null, -- overwrite_after_04
									 null, -- overwrite_after_05
									 null, -- overwrite_after_06
									 null, -- overwrite_after_07
									 null, -- overwrite_after_08
									 null, -- overwrite_after_09
									 null, -- overwrite_after_10
									 null, -- overwrite_after_11
									 null, -- overwrite_after_12
									 null, -- overwrite_after_13
									 null, -- overwrite_after_14
									 null -- overwrite_after_15
									 );			
		 
    FND_CONCURRENT.AF_COMMIT;
    
    FND_FILE.PUT_LINE(FND_FILE.LOG,'Request ID of XXNBTY MSC Load Production History in APCC Request Set Log : ' || v_request_id);  
                                               
    IF v_request_id != 0 THEN 
      FND_FILE.PUT_LINE(FND_FILE.LOG,'Successful.');     
    ELSE
      FND_FILE.PUT_LINE(FND_FILE.LOG,'Error in XXNBTY MSC Load Production History in APCC Request Set Load .'); 
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      x_retcode := 2;
      x_errbuf := SQLERRM; 
      FND_FILE.PUT_LINE(FND_FILE.LOG,'Error message : ' || x_errbuf);
  END submit_Import_Plan_Summary;

END XXNBTY_MSCEXT06_LOAD_HIST_PKG;
/
show errors;
