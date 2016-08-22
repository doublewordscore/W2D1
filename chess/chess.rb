require_relative 'board'
require_relative 'display'

class ChessError < StandardError
end

b = Board.new
b[[0,0]] = King.new(:black, b, [0,0])
b.move([0,0], [7,7])
d = Display.new(b)
# d.test_display
p b[[7,7]].moves
