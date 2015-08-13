\t
\x
--\pset border 0
\pset format wraped columns 100
\echo
\echo 10 SQL mais lentas
\echo ==================
SELECT 
    datname AS base, 
    sum(calls) calls, 
    round(sum(total_time)) AS secs, 
    round(sum(total_time)/sum(calls)) AS secs_per_call,
    sum(rows) AS rows, 
    query
FROM 
    pg_stat_statements AS s
    JOIN pg_roles AS r  ON r.oid = s.userid
    JOIN pg_database AS d ON d.oid = s.dbid
GROUP BY datname, query
ORDER BY secs_per_call DESC
LIMIT 10;
\x
\t
\pset border 1

