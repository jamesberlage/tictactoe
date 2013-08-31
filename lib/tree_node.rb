class TreeNode

  attr_accessor :value, :parent, :children

  def initialize(value=nil, parent=nil, children=[])
    @value, @parent, @children = value, parent, children
  end

end