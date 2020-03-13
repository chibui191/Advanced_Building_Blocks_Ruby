def bubble_sort(arr)
  if arr.kind_of?(Array)
    n = arr.length
    (n-1).times do 
      swapped = false
      (n-1).times do |j|
        if arr[j] > arr[j+1]
          arr[j], arr[j+1] = arr[j+1], arr[j]
          swapped = true
        end
      end
      break if !swapped
    end 
  end
  arr.inspect
end

def bubble_sort_by(arr)
  n = arr.length
  (n-1).times do
    swapped = false
    (n-1).times do |j|
      if yield(arr[j], arr[j+1]) > 0
        arr[j], arr[j+1] = arr[j+1], arr[j]
        swapped = true
      end
    end
    break if !swapped
  end
  arr.inspect
end

puts bubble_sort([3,4,1,7,0,0,0,1,3])

sorted_array = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

puts sorted_array