class BinarySearchTree
  def initialize
    @root = nil
  end

  def find(el)
  end

  def insert(el)
    return @root = nil if @root.nil?

    current_node = @root
    if el.val <= current_node.val && current_node.left.nil?
      return current_node.left = el
    elsif el.val > current_node.val && current_node.right.nil?
      return current_node.right = el
    else
      # set current_node to next node. Make this recursive in BSTNode class?
    end

  end

  def delete(el)
  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def maximum
  end

  def depth
  end
end
