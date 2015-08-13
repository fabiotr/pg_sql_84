\x
SELECT 
    procpid || ' - ' || waiting AS "PID - LOCKED",
    usename || ' - ' || host(client_addr) AS USER_IP,
    to_char(query_start,'HH24:MI:SS') || ' - ' || to_char(date_trunc('second', clock_timestamp() - query_start),'MI:SS') AS query_start,
    to_char(xact_start,'HH24:MI:SS')  || ' - ' || to_char(date_trunc('second', clock_timestamp() - xact_start ),'MI:SS') AS xact_start,
    current_query
FROM pg_stat_activity
WHERE 
	current_query NOT LIKE '<IDLE>%' AND
	procpid != pg_backend_pid()
ORDER BY usename, client_addr desc, xact_start desc, backend_start desc;
\x
