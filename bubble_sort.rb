def bubble_sort(new_array)
  begin
    swapped = false
          for i in 0...(new_array.length-1)
               if new_array[i] > new_array[i+1]
                  new_array[i+1], new_array[i] = new_array[i], new_array[i+1]
                  swapped = true
               end
          end
  end until !swapped
 new_array
end
bubble_sort([7,3,8,2,5])


def bubble_sort_by(item_array)
  begin
    swapped = false
    for i in 0...(item_array.length - 1)      
      block_result = yield(item_array[i],item_array[i+1])
      if block_result > 0
        item_array[i+1],item_array[i] = item_array[i],item_array[i+1]
	swapped = true
      end
    end
  end until !swapped
  item_array
end