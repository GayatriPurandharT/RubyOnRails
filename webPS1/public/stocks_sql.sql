--sql commands for ps2
DROP TABLE IF EXISTS my_stocks;
DROP TABLE IF EXISTS stock_price;
DROP TABLE IF EXISTS newly_acquired_stocks;
DROP FUNCTION IF EXISTS valuing_stock();
DROP FUNCTION IF EXISTS portfolio_value();


--creating my_stocks problem 7
create table my_stocks (
  symbol        varchar(20) not null,
  n_shares      integer not null,
  date_acquired date not null
);


\copy my_stocks from 'my_stocks.txt';

-- problem 8 copying data from my_stocks
create table stock_price as
  select symbol,current_date as quote_date,
         31.415 as price from my_stocks ;

insert into newly_acquired_stocks
       select * from my_stocks
       where date_acquired > '2017-05-15'::date;

--problem 9
 select my_stocks.symbol,n_shares as number_of_shares, price as price_per_share,price*n_shares as current_value
 from my_stocks cross join stock_price
 where my_stocks.symbol = stock_price.symbol ;

 insert into my_stocks (symbol,n_shares,date_acquired)
        values('FLIPKART','390','2017-10-15');

--problem 10
 select my_stocks.symbol,n_shares as number_of_shares, price as price_per_share,price*n_shares as current_value
 from my_stocks full outer join stock_price
 on my_stocks.symbol = stock_price.symbol ;

--problem 11

CREATE OR REPLACE FUNCTION valuing_stock(varchar(20)) RETURNS integer AS $$
DECLARE
  symbol ALIAS FOR $1;
  price integer := 0;
BEGIN
  FOR i IN 1 .. LENGTH(symbol) LOOP
    price = price + ASCII(SUBSTRING (symbol, i, 1));
  END LOOP;
  RETURN price;
END; $$ LANGUAGE plpgsql;

-- using ascii values to calculate new_prices of stocks
UPDATE stock_price
SET    price = updated_stock.new_price
FROM   (select symbol, valuing_stock(symbol) as new_price from my_stocks) as updated_stock
WHERE  updated_stock.symbol = stock_price.symbol;

-- show cross join
select my_stocks.symbol, n_shares, price as price_per_share, price
from my_stocks CROSS JOIN stock_price
where my_stocks.symbol = stock_price.symbol;

-- Calculating portfolio
CREATE OR REPLACE FUNCTION portfolio_value() RETURNS bigint AS $$
DECLARE
  stocks_cursor CURSOR FOR select *
       from my_stocks CROSS JOIN stock_price
       where my_stocks.symbol = stock_price.symbol;
  row  RECORD;
  aggregate_value bigint := 0;
BEGIN
  OPEN stocks_cursor;
  LOOP
    FETCH FROM stocks_cursor INTO row;
    EXIT WHEN NOT FOUND;
    aggregate_value = aggregate_value + (row.n_shares * row.price);
  END LOOP;
  return aggregate_value;
END; $$ LANGUAGE plpgsql;
-- Show
select portfolio_value();


-- Problem 12
--stocks that are higher than average
insert into my_stocks (symbol, n_shares, date_acquired)
  select my_stocks.symbol, n_shares, NOW() from my_stocks FULL OUTER JOIN stock_price
  ON my_stocks.symbol = stock_price.symbol
  where price > (select avg(price) from stock_price);

-- Showing: same query as problem 10
select my_stocks.symbol, n_shares, price as price_of_each_share, price*n_shares as current_value, date_acquired, quote_date
from my_stocks FULL OUTER JOIN stock_price
ON my_stocks.symbol = stock_price.symbol;


-- Showing with group by
select my_stocks.symbol, sum(n_shares) as total_n_shares, (price * sum(n_shares)) as total_value_held
from my_stocks FULL OUTER JOIN stock_price
ON my_stocks.symbol = stock_price.symbol
group by my_stocks.symbol, price;

-- Showing with group by and having
select my_stocks.symbol, sum(n_shares) as total_n_shares, (price * sum(n_shares)) as total_value_held
from my_stocks FULL OUTER JOIN stock_price
ON my_stocks.symbol = stock_price.symbol
group by my_stocks.symbol, price
having count(date_acquired) > 1;
