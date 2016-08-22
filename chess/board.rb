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



  protected

  def make_starting_grid
    @rows.each_with_index do |row, r_index|
      # debugger
      row.each_with_index do |square, c_index|
          if r_index.between?(0,1)
            self[[r_index, c_index]] = Piece.new(:black, self, [r_index, c_index])
          elsif r_index.between?(6,7)
            self[[r_index, c_index]] = Piece.new(:white, self, [r_index, c_index])
          else
            self[[r_index, c_index]] = NullPiece.instance
          end
      end
    end
    # p @rows
  end






end
