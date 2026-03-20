-- CASE式で主キーを入れ替える（制約を一時的に解除）
ALTER TABLE SomeTable DROP PRIMARY KEY;

UPDATE SomeTable
SET p_key = CASE
    WHEN p_key = 'a' THEN 'b'
    WHEN p_key = 'b' THEN 'a'
    ELSE p_key
END
WHERE p_key IN ('a', 'b');

ALTER TABLE SomeTable ADD PRIMARY KEY (p_key);