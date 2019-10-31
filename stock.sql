select code, open, macd_histogram, volume,(close - open) as grow
from stock_history
where open > 15
and macd_histogram > -2
and volume > 500000
and time = (select max(time) from stock_history)
order by macd_histogram asc


SELECT code, (close-open)*volume AS grow
FROM stock_history
WHERE time = (SELECT max(time) FROM stock_history)
ORDER BY grow ASC 
LIMIT 50


select code, open, macd_histogram, volume,(close - open) as grow
from stock_history
where open > 15
and macd_histogram > -2
and volume > 500000
and time >= select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 7)
order by macd_histogram asc


SELECT code, open, volume, vol20
from stock_history
where time = (select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 2))
and volume > vol20
order by volume desc

SELECT * FROM STOCK_HISTORY WHERE time = (select max(time) from stock_history) and code='AAA'



SELECT code, open, close, (close-open)*100/open as sa, volume, vol20, volume/vol20 as bu
from stock_history
where time = (select max(time) from stock_history)--(select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 2))
and volume > vol20
and volume > 100000
and sa > 0
order by sa desc

select min(time) from stock_history order by time desc limit 7
1164067200
1164067200
1569888000

delete from stock_history where code = 'AAA' and time = (select max(time) from stock_history)

# 
select code, low, low*volume as money from STOCK_HISTORY
WHERE time = (select max(time) from STOCK_HISTORY)
ORDER BY money desc
limit 50



(select distinct time as mintime from stock_history order by time desc limit 7)


select * from (select code, low, low*volume as money, close - open as diff, volume from STOCK_HISTORY
WHERE time = (select max(time) from STOCK_HISTORY)
and diff > 1
ORDER BY money desc
limit 50)
order by diff desc

(select * from stock_history where time = (select max(time) from STOCK_HISTORY)) AS IMA
(select * from stock_history where time = (select min(time) from STOCK_HISTORY order by tim desc limit 20)) AS KAKO

select IMA.code, IMA.time, KAKO.time, IMA.low, IMA.low - KAKO.low as DIFF
from (select * from stock_history where time = (select max(time) from STOCK_HISTORY)) AS IMA
LEFT JOIN (select * from stock_history where time = (select min(time) from STOCK_HISTORY order by tim desc limit 20)) AS KAKO ON IMA.code = KAKO.code


select IMA.code, KAKO.low, IMA.low - KAKO.low as DIFF
from (select code, low from stock_history where time = (select max(time) from STOCK_HISTORY)) AS IMA
LEFT JOIN (select code, low from stock_history where time = (select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 20))) AS KAKO 
ON IMA.code = KAKO.code


select IMA.code, KAKO.low, round((IMA.low - KAKO.low)/kako.low,1) as DIFF , IMA.volume
from (select code, low, volume from stock_history where volume > 30000 and time = (select max(time) from STOCK_HISTORY)) AS IMA
LEFT JOIN (select code, low from stock_history where time = (select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 20))) AS KAKO 
ON IMA.code = KAKO.code
order by diff desc


select IMA.*, IMA.high - BEFORE3.low as counter
from (select code, low from stock_history where time = (select max(time) from STOCK_HISTORY)) AS IMA
left JOIN (select * from stock_history where time = (select min(mintime) from (select distinct time as mintime from stock_history order by time desc limit 20))) AS BEFORE3 
ON IMA.code = BEFORE3.code


select code, close, round(close-open,2) as grow, round((close-open)*100/open,2) as percent, volume from Stock_history
where time = (select max(time) from stock_history)
and volume > 200000
and close > 10
order by percent desc
limit 50