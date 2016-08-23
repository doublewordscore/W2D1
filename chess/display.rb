require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  attr_accessor :cursor, :show_debug_info

  def initialize(board, show_debug_info = false)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def move(new_pos)
  end

  def render
    @board.rows.each_with_index do |row, r_index|
      row.each_with_index do |square, c_index|
        if @cursor.cursor_pos == [r_index, c_index]
          print "#{square} ".blue.on_red.blink
        elsif (r_index + c_index).even? && square.color.nil?
          print "#{square} ".on_green
        elsif (r_index + c_index).odd? && square.color.nil?
          print "#{square} ".on_yellow
        elsif (r_index + c_index).even? && square.color == :black
          print "#{square} ".black.on_green
        elsif (r_index + c_index).even? && square.color == :white
          print "#{square} ".white.on_green
        elsif (r_index + c_index).odd? && square.color == :black
          print "#{square} ".black.on_yellow
        elsif (r_index + c_index).odd? && square.color == :white
          print "#{square} ".white.on_yellow
        else
          print "AHHH"
        end

      end
      puts
    end
    if show_debug_info
      p @cursor_pos
      sleep 10
    end
  end


end
