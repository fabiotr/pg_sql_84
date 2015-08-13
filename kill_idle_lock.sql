\echo '--Kill IDLE locking' 
\t
\o /home/postgres/tmp/kill_idle_lock.sql

 SELECT DISTINCT 'SELECT pg_terminate_backend(' || l.procpid || '); --user = ' || l.usename AS kill_bastards
   FROM pg_stat_activity w
   JOIN pg_locks l1 ON w.procpid = l1.pid AND NOT l1.granted
   JOIN pg_locks l2 ON l1.relation = l2.relation AND l2.granted
   JOIN pg_stat_activity l ON l2.pid = l.procpid
   JOIN pg_stat_user_tables t ON l1.relation = t.relid
  WHERE 
	w.waiting AND 
	l.current_query = '<IDLE> in transaction' AND
	l.usename !='utdlx01' AND
	l.usename !='uengine' AND
	l.usename !='ucap_trx' AND
	l.usename !='ucap_rep'
;
\o
\t
\i kill_tmp.sql
