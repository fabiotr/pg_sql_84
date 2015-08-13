\t
\x
--\pset border 0
\pset format wraped columns 100
\echo
\echo 10 SQL mais chamados
\echo ====================
SELECT datname AS base, sum(calls) calls, round(sum(total_time)) AS secs, sum(rows) AS rows, query
FROM 
    pg_stat_statements AS s
    JOIN pg_roles AS r  ON r.oid = s.userid
    JOIN pg_database AS d ON d.oid = s.dbid
GROUP BY datname, query
ORDER BY calls DESC
LIMIT 10;
\x
\t
\pset border 1

