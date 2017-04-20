class BSTNode
  attr_reader :left, :right, :val
  def initialize(val)
    @val = val
    @left, @right = nil
  end
end
