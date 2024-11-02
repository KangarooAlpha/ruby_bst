require_relative "tree.rb"
require_relative "node.rb"

tree = Tree.new()
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree.build_tree(arr)

tree.pretty_print()