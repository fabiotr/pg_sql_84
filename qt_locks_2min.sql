SELECT count(1)
   FROM pg_locks waiting
   JOIN pg_stat_activity waiting_stm ON waiting_stm.procpid = waiting.pid
   JOIN pg_locks other ON waiting.database = other.database AND waiting.relation = other.relation OR waiting.transactionid = other.transactionid
   JOIN pg_stat_activity other_stm ON other_stm.procpid = other.pid
  WHERE 
    waiting.granted = false AND 
    waiting.pid <> other.pid AND
    current_timestamp - other_stm.query_start > INTERVAL '2' MINUTE;
