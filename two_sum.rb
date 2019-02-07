def two_sum?(arr, target_sum)
  val_search = 0
  arr.each do |val|
    val_search = target_sum - val
    arr.delete(val)
    return true if arr.include?(val_search)
    arr.unshift(val)
  end
  false
end
# The two_sum? method will subtract each value from the target and look for the remainder in the array - to avoid searching the same number it deletes then adds the number back after the check - O(n) complexity with O(1) space complexity
def bad_two_sum?(arr, target_sum)
  values = arr.permutation(2).to_a
  p values.length
  values.each do |vals|
    return true if vals.first + vals.last == target_sum
  end
  false
end
# bad_two_sum? uses permutations which gives us every combination for 2 elements and at only 100 numbers in the array creates 10100 sub_arrays to search thru if the number array was 1000 numbers long we'd end up with 1000000 sub arrays so the complexity for both space and time becomes O(n^2)


# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6)
# p two_sum?(arr, 10) 
def okay_two_sum(arr, target_sum)
  arr = arr.sort!
  left = 0
  right = arr.length -1
  while left < right
    sum = arr[left] + arr[right]
    if sum < target_sum
      left += 1
    elsif sum > target_sum
      right -= 1
    else
      return true
    end
  end
  false
end

#okay two sum sorts the array O(n log n) which will affect it with larger arrays. the search looks at the lowest and largest number then compares them and will either decrease the higher number if the value is too high or increase the lower number if its too low until either the value is found or the two indices meet each other this algorithm should scale linear to the length of the array O(n) 

def two_sum_hash?(arr, target_sum)
  hash = Hash.new(0)
  arr.each_with_index do |val, i|
    hash[i] = val
  end
  left = 0
  right = hash.length - 1
  while left < right
    sum = hash[left] + hash[right]
    if sum < target_sum
      left += 1
    elsif sum > target_sum
      right -= 1
    else
      return true
    end
  end
  false
end
# Once the hash is built O(n) the look up of values remains constant since we are using a hash to compare values as we did in the previous method
# arr = [0, 1, 5, 7]
# p two_sum_hash?(arr, 6)
# p two_sum_hash?(arr, 10) 