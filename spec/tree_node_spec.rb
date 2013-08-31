require 'rspec'
require 'tree_node'

describe TreeNode do

  subject(:tree_node) { TreeNode.new(13) }

  it "has a parent" do
    expect(tree_node.parent).to be_nil
  end

  it "has children" do
    expect(tree_node.children).to eq([])
  end

  it "has a value" do
    expect(tree_node.value).to eq(13)
  end

  describe "#==" do

    let(:other_node) { double("other_node", value: 13, parent: nil, children: []) }

    it "checks for equivalent nodes" do
      expect(tree_node == other_node).to be_true
    end

  end

  describe "#parent=" do

    let(:node_without_children) { double("node_without_children", value: 13, parent: nil, children: []) }
    let(:node_with_children) { double("node_with_children", value: 23, parent: nil, children: [tree_node]) }

    it "sets parent equal to another node" do
      tree_node.parent = node_with_children
      expect(tree_node.parent).to eq(node_with_children)
    end

    it "raises error if the parent has no children" do
      expect { tree_node.parent = node_without_children }.to raise_error("can't add a parent unless they claim you as their child")
    end

  end

  describe "#add_child" do

    let(:child_node) { TreeNode.new(14) }

    it "changes the child's parent to be the current node" do
      tree_node.add_child(child_node)
      expect(child_node.parent).to eq(tree_node)
    end

    it "adds the child to the current node's children" do
      tree_node.add_child(child_node)
      expect(tree_node.children.include?(child_node)).to be_true
    end

  end

end
















