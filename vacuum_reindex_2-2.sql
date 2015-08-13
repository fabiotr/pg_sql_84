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

\echo 'Removido o REINDEX DATABASE bbtmd; por estar demorando mais de 24 horas'
REINDEX TABLE utmdlx01.tbom_d01_dcto;
REINDEX TABLE utmdlx01.tbom_l35_dcto_log;
REINDEX TABLE utmdlx01.tbom_l36_arqu_regi;
REINDEX TABLE utmdlx01.tbom_d03_dcto_pont;
REINDEX TABLE utmdlx01.tbom_d18_dcto_reco;
REINDEX TABLE utmdlx01.tbom_d20_dcto_imag_esta;
REINDEX TABLE utmdlx01.tbom_l31_dcto_hash_log ;
REINDEX TABLE utmdlx01.tbom_o01_ocor ;
REINDEX TABLE utmdlx01.tbom_d51_dcto_cust;
REINDEX TABLE utmdlx01.tbom_d05_dcto_dupl;
REINDEX TABLE utmdlx01.tbom_d04_dcto_grup;
REINDEX TABLE utmdlx01.tbom_l05_proc_erro_log;
REINDEX TABLE utmdlx01.tbom_r02_rems_bloc;
REINDEX TABLE utmdlx01.tbom_r06_rems_bloc_deta;
REINDEX TABLE utmdlx01.tbom_r07_rems_bloc_nsc;
REINDEX TABLE utmdlx01.tbom_p21_esta_trab_agen;
REINDEX TABLE utmdlx01.tbom_u14_ctrl_login;
REINDEX TABLE utmdlx01.tbom_d15_dcto_totz_temp;
REINDEX TABLE utmdlx01.tbom_p15_esta_nsc;
REINDEX TABLE utmdlx01.tbom_p11_repl_tabl;
REINDEX TABLE utmdlx01.tbom_l23_arqu_hist;
REINDEX TABLE utmdlx01.tbom_n02_prop_pers;
REINDEX TABLE utmdlx01.tbom_v05_repl_loca_agen_dml;
REINDEX TABLE utmdlx01.tbom_p05_banc_agen;
REINDEX TABLE utmdlx01.tbom_l20_arqu_cont_tran;
REINDEX TABLE utmdlx01.tbom_p04_banc;
REINDEX TABLE utmdlx01.tbom_i12_rela_said;
REINDEX TABLE utmdlx01.tbom_v65_repl_lota_hier_usua;
REINDEX TABLE utmdlx01.tbom_d02_dcto_reca;
REINDEX TABLE utmdlx01.tbom_d90_dcto_imag_nsc;
REINDEX TABLE utmdlx01.tbom_u01_usua;
REINDEX TABLE utmdlx01.tbom_v02_repl_loca;
REINDEX TABLE utmdlx01.tbom_d16_dcto_totz_asso;
REINDEX TABLE utmdlx01.tbom_r03_rems_entr;
REINDEX TABLE utmdlx01.tbom_n14_proc_estr_camp;
REINDEX TABLE utmdlx01.tbom_p51_codi_font;
REINDEX TABLE utmdlx01.tbom_d10_dcto_espe;
REINDEX TABLE utmdlx01.tbom_u13_usua_mens;
REINDEX TABLE utmdlx01.tbom_n13_proc_comp;
REINDEX TABLE totais;
REINDEX TABLE utmdlx01.tbom_v03_repl_loca_usua;
REINDEX TABLE utmdlx01.tbom_p64_lota_deta;
REINDEX TABLE utmdlx01.tbom_p62_lota_hier;
REINDEX TABLE utmdlx01.tbom_p07_feri;
REINDEX TABLE utmdlx01.tbom_d21_dcto_totz_bilh_hora;
REINDEX TABLE utmdlx01.tbom_p24_lota;
REINDEX TABLE utmdlx01.tbom_p13_esta_trab;
REINDEX TABLE utmdlx01.tbom_d08_dcto_ctrl;
REINDEX TABLE utmdlx01.tbom_p08_muni;
REINDEX TABLE utmdlx01.tbom_v04_repl_loca_agen;

