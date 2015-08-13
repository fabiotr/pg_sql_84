select 
      case when current_query ilike '%select%' then 'Select'
           when current_query ilike '%delete%' then 'Delete'
           when current_query ilike '%update%' then 'Update'
           when current_query ilike '%insert%' then 'Insert'
           when current_query ilike '%execute%' then 'Execute'
           when current_query ilike '%Close%' then 'Close'
           when current_query ilike '%Commit%' then 'Commit'
           when current_query ilike '%Truncate%' then 'Truncate'
           when current_query ilike '%analyze%' then 'Analyze'
           when current_query ilike '%set%' then 'Set'
           when current_query ilike '%rollback%' then 'Rollback'
           when current_query ilike '%fetch%' then 'Fetch'
           when current_query ilike '%autovacuum%' then 'Autovacuum'
           else current_query
      end,
      count(1)
from pg_stat_activity
group by
      case when current_query ilike '%select%' then 'Select'
           when current_query ilike '%delete%' then 'Delete'
           when current_query ilike '%update%' then 'Update'
           when current_query ilike '%insert%' then 'Insert'
           when current_query ilike '%execute%' then 'Execute'
           when current_query ilike '%Close%' then 'Close'
           when current_query ilike '%Commit%' then 'Commit'
           when current_query ilike '%Truncate%' then 'Truncate'
           when current_query ilike '%analyze%' then 'Analyze'
           when current_query ilike '%set%' then 'Set'
           when current_query ilike '%rollback%' then 'Rollback'
           when current_query ilike '%fetch%' then 'Fetch'
           when current_query ilike '%autovacuum%' then 'Autovacuum'
           else current_query
      end
order by 1;
