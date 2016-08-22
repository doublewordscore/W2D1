require_relative 'board'
require_relative 'display'

class ChessError < StandardError
end

b = Board.new
# b[[1,0]] = King.new(:white, b, [1,0])
b.move([7,4], [2,0])
# b[[7,0]].has_moved = true
d = Display.new(b)
# d.test_display
p b.in_check?(:white)
