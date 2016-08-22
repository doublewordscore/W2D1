# require_relative 'chess'
require_relative 'display'
require_relative 'piece'
require_relative 'null_piece'
require 'byebug'

class Board

  attr_accessor :rows

  def self.in_bounds?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def move(from_pos, to_pos)
    begin
      current_piece = self[from_pos]
      if current_piece.class == NullPiece
        raise ChessError.new("No piece at starting position")
      end

      raise ChessError.new("Cannot move to that position") unless Board.in_bounds?(to_pos)
      current_piece.pos = to_pos
      self[from_pos] = NullPiece.instance
      self[to_pos] = current_piece
    rescue ChessError => e
      puts e.message
    end
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end

  def dup
  end


  def checkmate?
  end

  def in_check?(color)
    other_color = color == :white ? :black : :white
    king = @rows.flatten.select { |piece| piece.is_a?(King) &&
      piece.color == color}.first
    p king
    opponent_pieces = @rows.flatten.select { |piece| piece.color == other_color }
    opponent_pieces.any? { |piece| piece.moves.include?(king.pos) }
  end




  protected

  def make_starting_grid

    self[[0,0]] = Rook.new(:black, self, [0,0])
    self[[0,1]] = Knight.new(:black, self, [0,1])
    self[[0,2]] = Bishop.new(:black, self, [0,2])
    self[[0,3]] = Queen.new(:black, self, [0,3])
    self[[0,4]] = King.new(:black, self, [0,4])
    self[[0,5]] = Bishop.new(:black, self, [0,5])
    self[[0,6]] = Knight.new(:black, self, [0,6])
    self[[0,7]] = Rook.new(:black, self, [0,7])
    @rows.each_with_index do |row, r_index|
      row.each_with_index do |square, c_index|
        if r_index == 0
          next
        elsif r_index == 1
          self[[r_index, c_index]] = Pawn.new(:black, self, [r_index, c_index])
        elsif r_index.between?(2,5)
          self[[r_index, c_index]] = NullPiece.instance
        elsif r_index == 6
          self[[r_index, c_index]] = Pawn.new(:white, self, [r_index, c_index])
        else
        end
      end
    end
    self[[7,0]] = Rook.new(:white, self, [7,0])
    self[[7,1]] = Knight.new(:white, self, [7,1])
    self[[7,2]] = Bishop.new(:white, self, [7,2])
    self[[7,3]] = Queen.new(:white, self, [7,3])
    self[[7,4]] = King.new(:white, self, [7,4])
    self[[7,5]] = Bishop.new(:white, self, [7,5])
    self[[7,6]] = Knight.new(:white, self, [7,6])
    self[[7,7]] = Rook.new(:white, self, [7,7])

  end






end
