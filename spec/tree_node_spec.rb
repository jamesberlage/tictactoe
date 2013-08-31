require 'rspec'
require 'tree_node'

describe TreeNode do

  subject(:tree_node) { TreeNode.new }

  it "has a parent" do
    expect(tree_node.parent).to be_nil
  end

  it "has children" do
    expect(tree_node.children).to eq([])
  end

  it "has a value" do
    expect(tree_node.value).to be_nil
  end

  it "checks for equivalent nodes"

  describe "#parent=" do

  end

  describe "#add_child" do

    it "changes the child's parent to be the current node"

    it "adds the child to the current node's children"

  end

end