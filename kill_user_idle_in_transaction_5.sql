\echo '--Eliminando conexoes de usuaios nao padrao em IDLE in transaction por mais de 5 minutos'
select count(1) AS qt, 
    to_char(avg(now() - query_start),'HH24:MI:SS') media_tempo, 
    current_query 
from pg_stat_activity 
where 
    usename NOT IN ('uengine','utmdlx01','ucap_trx','ucap_rep','postgres') AND 
--    text(client_addr) like '10.%' AND
    current_query = '<IDLE> in transaction' AND
    now() - query_start > '5 minute'::interval
group by current_query 
order by count(1) desc, media_tempo desc;

\t
\o /home/postgres/tmp/kill_idle_in_transaction_5.sql
select 'select pg_terminate_backend('  || procpid || ');' 
    from pg_stat_activity 
    where 
        usename NOT IN ('uengine','utmdlx01','ucap_trx','ucap_rep','postgres') and 
--        text(client_addr) like '10.%' AND
        current_query = '<IDLE> in transaction' AND
        now() - query_start > '5 minute'::interval;
\o
\o /home/postgres/tmp/kill.txt
\i /home/postgres/tmp/kill_idle_in_transaction_5.sql
\o
\t

