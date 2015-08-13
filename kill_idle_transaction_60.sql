\echo '--Kill <IDLE> in transaction with more then 60 minutes' 
SELECT count(1) AS qt,
    to_char(avg(now() - query_start),'HH24:MI:SS') media_tempo
    FROM pg_stat_activity
    WHERE
        xact_start < current_timestamp - '1 hour'::interval AND
        current_query = '<IDLE> in transaction' 
;
\t
\o /home/postgres/tmp/kill_idle_transaction_60.sql
SELECT 'SELECT pg_terminate_backend(' || procpid || '); --xact_start = ' || xact_start AS kill_bastards
    FROM pg_stat_activity 
    WHERE 
	xact_start < current_timestamp - '1 hour'::interval AND
	current_query = '<IDLE> in transaction' 
    ORDER BY xact_start
;
\o
\o /home/postgres/tmp/kill.txt
\i /home/postgres/tmp/kill_idle_transaction_60.sql
\o
\t
