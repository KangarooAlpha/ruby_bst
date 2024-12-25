require_relative("node.rb")
class Tree
  attr_reader :root
  def initialize(array = [])
    array = array.uniq.sort() unless array.empty?
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty? 
    mid = (array.length-1)/2
    root = Node.new(array[mid])
    root.right = build_tree(array[mid+1..-1])
    root.left = build_tree(array[0...mid])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    #debugger
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(elem, node = @root)
    return Node.new(elem) if node.nil?
    return node if node.data == elem

    if elem < node.data
      node.left = insert(elem, node.left)
    elsif elem > node.data
      node.right = insert(elem, node.right)
    end
    return node
  end

  def delete(elem, node = @root)
    return node if node.nil?
    if elem < node.data
      node.left = delete(elem, node.left)
    elsif elem > node.data
      node.right = delete(elem, node.right)
    else
      if node.right.nil?
        return node.left
      elsif node.left.nil?
        return node.right
      end
      
    end
    node
  end
    
end