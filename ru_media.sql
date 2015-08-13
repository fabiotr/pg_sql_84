SELECT count(1) AS qt, 
    to_char(avg(now() - query_start),'HH24:MI:SS') media_tempo, 
    current_query 
FROM pg_stat_activity 
WHERE procpid != pg_backend_pid()
GROUP BY current_query 
ORDER BY qt desc, media_tempo desc;
