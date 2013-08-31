require './lib/tree_node'

class ComputerPlayer

  def initialize(symbol, board)
    super(symbol, board)
    @tree_root = TreeNode.new
  end

  def make_game_tree(root)

  end

  def is_winning_node?(node)
    node.value[:board].winning_board?(@symbol)
  end

  def is_losing_node?(node)
    node.value[:board].losing_board?(@symbol)
  end

  def switch_symbols(symbol)
    symbol == :x ? :o : :x
  end

end