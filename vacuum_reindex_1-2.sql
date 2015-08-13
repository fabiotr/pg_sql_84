SELECT pg_reload_conf();
\echo '--Kill ALL' 
\t
\o /home/postgres/tmp/kill_ALL_bastards.sql
SELECT 'SELECT pg_terminate_backend(' || procpid || ');' 
    FROM pg_stat_activity 
    WHERE procpid != pg_backend_pid();
\o
\t
\i /home/postgres/tmp/kill_ALL_bastards.sql

\echo '--Kill ALL AGAIN' 
\t
\o /home/postgres/tmp/kill_ALL_bastards.sql
SELECT 'SELECT pg_terminate_backend(' || procpid || ');' 
    FROM pg_stat_activity 
    WHERE procpid != pg_backend_pid();
\o
\t
\i /home/postgres/tmp/kill_ALL_bastards.sql

SET temp_buffers TO '16GB';
SET work_mem     TO'16GB';
SET maintenance_work_mem TO '32GB';

\timing
VACUUM FREEZE ANALYZE VERBOSE;

CLUSTER tbom_d01_dcto           USING co_omd01_pk ;
CLUSTER tbom_d02_dcto_reca      USING co_omd02_pk;
CLUSTER tbom_d03_dcto_pont      USING co_omd03_pk ;
CLUSTER tbom_d04_dcto_grup      USING co_omd04_pk ;
CLUSTER tbom_d05_dcto_dupl      USING co_omd05_pk ;
CLUSTER tbom_d06_dcto_totz      USING co_omd06_pk ;
CLUSTER tbom_d08_dcto_ctrl      USING co_omd08_pk ;
CLUSTER tbom_d10_dcto_espe      USING co_omd10_pk ;
CLUSTER tbom_d15_dcto_totz_temp USING co_omd15_pk ;
CLUSTER tbom_d16_dcto_totz_asso USING co_omd16_pk ;
CLUSTER tbom_d18_dcto_reco      USING co_omd18_pk ;
CLUSTER tbom_d20_dcto_imag_esta USING co_omd20_pk ;
CLUSTER tbom_d30_dcto_ctrl_agen USING co_omd30_pk ;
CLUSTER tbom_d51_dcto_cust      USING co_oml51_pk ;
CLUSTER tbom_l35_dcto_log       USING co_oml35_pk ;
CLUSTER tbom_l36_arqu_regi      USING co_oml36_pk ;
CLUSTER tbom_o01_ocor           USING co_omo01_pk ;
CLUSTER tbom_o02_ocor_tipo      USING co_omo02_pk ;
CLUSTER tbom_p05_banc_agen      USING co_omp05_pk ;
CLUSTER tbom_p03_prmt_site      USING co_omp03_pk ;
CLUSTER tbom_p10_moni_proc      USING co_omp10_pk ;
CLUSTER tbom_p15_esta_nsc       USING co_omp15_pk ;
CLUSTER tbom_p24_lota           USING co_omp24_pk ;
CLUSTER tbom_p51_codi_font      USING co_omp51_pk ;
CLUSTER tbom_p62_lota_hier      USING co_omp62_pk ;
CLUSTER tbom_p64_lota_deta      USING co_omp64_pk ;
CLUSTER tbom_r03_rems_entr      USING co_omr03_pk ;
CLUSTER tbom_r02_rems_bloc      USING co_omr02_pk ;
CLUSTER tbom_r06_rems_bloc_deta USING co_omr06_pk ;
CLUSTER tbom_u11_usua_espe      USING co_omu11_pk ;
