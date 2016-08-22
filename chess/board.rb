require_relative 'chess.rb'
require_relative 'display.rb'
require_relative 'piece.rb'

class Board

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def move(start_pos, end_pos)
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


  def move_piece(color, from_pos, to_pos)
    begin
      current_piece = @rows[from_pos]
      if current_piece.class == NullPiece
        raise ChessError.new("No piece at starting position")
      end

      raise ChessError.new("Cannot move to that position") #if ??
      current_piece.pos = to_pos
      @row[from_pos] = NullPiece.new
      @rows[to_pos] = current_piece
    rescue ChessError => e
      puts e.message
    end
  end

  def move_piece!(from_pos, to_pos)
  end

  def checkmate?
  end



  protected

  def make_starting_grid
    @rows.each_with_index do |row, r_index|
      row.each_with_index do |square, c_index|
          if r_index.between?(0,1)
            square = Piece.new(:black, self, [r_index, c_index])
          elsif r_index.between?(6,7)
            square = Piece.new(:white, self, [r_index, c_index])
          else
            square = NullPiece.new
          end
      end
    end
  end











end
