\x
SELECT 
    procpid,
    usename, 
    client_addr,
    waiting,
    to_char(query_start,  'DD HH24:MI:SS') || ' | ' || to_char(date_trunc('second', clock_timestamp() - query_start),'HH24:MI:SS') AS query_start,
    to_char(xact_start,   'DD HH24:MI:SS') || ' | ' || to_char(date_trunc('second', now() - xact_start),'HH24:MI:SS')AS xact_start,
    to_char(backend_start,'DD HH24:MI:SS') || ' | ' || to_char(date_trunc('second', now() - backend_start),'HH24:MI:SS')AS conn_start,
    current_query
FROM pg_stat_activity 
WHERE 
    query_start < now() - '10 min'::interval AND
    current_query NOT LIKE '<IDLE>%'
ORDER BY query_start;
\x
