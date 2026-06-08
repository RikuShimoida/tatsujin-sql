SELECT * FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG(hanbai_tanka) OVER (ORDER BY shohin_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg FROM Shohin;