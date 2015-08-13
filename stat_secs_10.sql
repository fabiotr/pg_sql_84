\t
\x
--\pset border 0
\pset format wraped columns 100
\echo
\echo 10 SQL que consumiram mais tempo
\echo ================================
SELECT datname AS base, rolname AS user, calls, round(total_time) AS secs, rows, query
FROM 
    pg_stat_statements AS s
    JOIN pg_roles AS r  ON r.oid = s.userid
    JOIN pg_database AS d ON d.oid = s.dbid
ORDER BY secs DESC
LIMIT 10;
\x
\t
\pset border 1

