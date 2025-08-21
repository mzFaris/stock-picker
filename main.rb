def stock_picker(stocks)
  buy_time = stocks.index(stocks.min)
  sell_time = buy_time
  max_profit = 0

  stocks.each_with_index do |stock, i|
    future_stocks = stocks[i+1..-1]
    next if future_stocks.empty?
    sell_value = future_stocks.max
    if (sell_value - stock) > max_profit
      max_profit = sell_value - stock
      buy_time = i
      sell_time = stocks.index(sell_value)
    end
  end

  [buy_time, sell_time]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
