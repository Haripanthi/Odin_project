def stock_picker(data)
  
  i = 0
  j = 0
  max_profit = 0

  while i < data.size do
    while j < data.size do
      if data[j] - data[i] > max_profit && j < i
        best_sell = data[j]
        best_buy = data[i]
        max_profit = best_sell - best_buy
      end
      j += i
    end
    j = 0
    i += 1
  end
[data.index(best_buy), data.index(best_sell)]
  
end
