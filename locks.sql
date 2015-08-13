\x
 SELECT l.procpid AS l_pid, l.usename AS l_user, l.xact_start AS l_start, l.client_addr AS l_ip, (t.schemaname::text || '.'::text) || t.relname::text AS locked_table, w.procpid AS w_pid, w.usename AS w_user, l.current_query AS locking_query, w.current_query AS waiting_query
   FROM pg_stat_activity w
   JOIN pg_locks l1 ON w.procpid = l1.pid AND NOT l1.granted
   JOIN pg_locks l2 ON l1.relation = l2.relation AND l2.granted
   JOIN pg_stat_activity l ON l2.pid = l.procpid
   JOIN pg_stat_user_tables t ON l1.relation = t.relid
  WHERE w.waiting
  ORDER BY l.xact_start, l.usename, l.procpid;
\x
