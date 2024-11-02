require_relative("node.rb")
class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  def build_tree(array)
    node = Node.new()
    until array.length() <=1
      node.data = array.shift if node.data == nil
      node.left = array.shift if array[0] < node.data
      node.right = array.shift if array[0] > node.data
      node.data = node.left if array[0] < node.data
      node.data = node.right if array[0] > node.data
      p node.data
    end

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
    
end