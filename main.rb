require_relative "tree.rb"
require_relative "node.rb"

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr)
tree.insert(20)
tree.pretty_print()