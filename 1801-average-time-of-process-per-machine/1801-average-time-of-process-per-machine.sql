SELECT 
    machine_id,
    ROUND(AVG(timestamp_diff), 3) AS processing_time
FROM (
    SELECT 
        machine_id,
        process_id,
        AVG(CASE WHEN activity_type = 'end' THEN timestamp END) - AVG(CASE WHEN activity_type = 'start' THEN timestamp END) AS timestamp_diff
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_times
GROUP BY machine_id;
