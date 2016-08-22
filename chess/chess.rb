require_relative 'board'
require_relative 'display'

class ChessError < StandardError
end

b = Board.new
b.move_piece("white", [0,0], [4,4])
d = Display.new(b)
d.test_display
