class TreeNode

  attr_reader :parent
  attr_accessor :value, :children

  def initialize(value=nil, parent=nil, children=[])
    @value, @parent, @children = value, parent, children
  end

  def ==(other_node)
    self.value == other_node.value &&
    self.parent == other_node.parent &&
    self.children == other_node.children
  end

  def parent=(other_node)
    raise "can't add a parent unless they claim you as their child" unless other_node.children.include?(self)

    @parent = other_node
  end

  def add_child(other_node)
    self.children << other_node
    other_node.parent = self
  end

end