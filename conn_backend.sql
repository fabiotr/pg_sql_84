SELECT 
        procpid pid, 
        usename "user", 
        client_addr IP, 
        waiting blk, 
        to_char(query_start,'HH24:MI') query_start, 
        to_char(xact_start,'HH24:MI') xact_start, 
        to_char(backend_start,'DD HH24:MI') conn_start,
        current_query 
FROM pg_stat_activity 
WHERE procpid != pg_backend_pid()
ORDER BY backend_start ;
