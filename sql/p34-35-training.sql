SELECT * FROM LoadSample;

-- これでも結果はMINと同じ
SELECT sample_date AS cur_date,
       load_val    AS cur_load,
       MAX(sample_date) OVER W AS latest_date,
       MAX(load_val)    OVER W AS latest_load
FROM LoadSample
WINDOW W AS (ORDER BY sample_date ASC
             ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING);

SELECT sample_date AS cur_date,
       load_val    AS cur_load,
       MIN(sample_date) 
         OVER (ORDER BY sample_date ASC 
               RANGE BETWEEN INTERVAL '1' DAY PRECEDING 
                         AND INTERVAL '1' DAY PRECEDING) AS day1_before,
       MIN(load_val) 
         OVER (ORDER BY sample_date ASC 
               RANGE BETWEEN INTERVAL '1' DAY PRECEDING 
                         AND INTERVAL '1' DAY PRECEDING) AS load_day1_before
FROM LoadSample;