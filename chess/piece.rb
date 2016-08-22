require_relative 'board'

class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    color == :white ? "♘" : "♗"
  end

  def inspect
    "#{color} piece in spot #{pos}"
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private

  def move_into_check?(to_pos)
  end







end
