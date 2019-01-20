class FirstController < ApplicationController
  def index
    @res = 1+1
    # render 'page'
  end
  def stocks_i_like
    sql = 'select my_stocks.symbol, sum(n_shares) as total_n_shares, (price * sum(n_shares)) as total_value_helds
from my_stocks FULL OUTER JOIN stock_price
ON my_stocks.symbol = stock_price.symbol
group by my_stocks.symbol, price
having count(date_acquired) > 1;
'

    @results = ActiveRecord::Base.connection.exec_query(sql)
    if @results.present?
      @results.each do |row|
        puts row
      end
      return @results
    else
      return nil
    end
  end

  def transcript
    content = Rails.root.join 'public/stocks_sql.sql'
    str = content.to_s
    @filecontent = File.read(str)
  end

  def log
    content = Rails.root.join 'public/sql_log.txt'
    str = content.to_s
    @filecontent = File.read(str)
  end
  def input
    content = Rails.root.join 'public/my_stocks.txt'
    str = content.to_s
    @filecontent = File.read(str)
  end
end
