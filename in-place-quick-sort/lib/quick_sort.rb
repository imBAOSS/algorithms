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
    return array if length <= 1
    pivot = QuickSort.partition(array, start, length)
    QuickSort.sort2!(array, start, array[0...pivot].length)
    QuickSort.sort2!(array, pivot + 1, array[pivot + 1..-1].length)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    pivot = array[start]
    barrier_idx = start + 1
    i = start + 1

    while i < start + length
      if prc.call(pivot, array[i]) > 0
        array[barrier_idx], array[i] = array[i], array[barrier_idx]
        barrier_idx += 1
      end
      i += 1
    end

    array[start], array[barrier_idx] = array[barrier_idx], array[start]

    barrier_idx - 1
  end
end
