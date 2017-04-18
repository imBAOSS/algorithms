class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot = array.first
    left = array[1..-1].select { |num| num <= pivot }
    right = array[1..-1].select { |num| num > pivot }

    return QuickSort.sort1(left) + [pivot] +  QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    pivot = array[start]
    barrier_idx = start
    i = start

    while i < start + length
      if prc.call(pivot, array[i]) > 0
        array[barrier_idx + 1], array[i] = array[i], array[barrier_idx + 1]
        barrier_idx += 1
      end
      i += 1
    end

    array[start], array[barrier_idx] = array[barrier_idx], array[start]

    barrier_idx
  end
end

# pick pivot
# check next num
# if num is less than pivot, swap with number to right of barrier index and increase barrier index by one
# if num is greater than pivot, do not increase barrier index
# after cycle is finished, swap pivot with first number to left of pivot
