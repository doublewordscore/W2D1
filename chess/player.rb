class HumanPlayer

  attr_reader :name
  attr_accessor :color

  def initialize(name)
    @name = name
  end

  def notify_players
    puts "It is #{name}'s turn!"
  end

  def play_turn(display)

    notify_players
    display.render
    while display.cursor.get_input
      system("clear")
      notify_players
      display.render
    end
    from_pos = display.cursor.cursor_pos

    system("clear")
    display.render
    while display.cursor.get_input
      system("clear")
      display.render
    end
    to_pos = display.cursor.cursor_pos

    [from_pos, to_pos]
  end

end


class ComputerPlayer
  attr_reader :name
  attr_accessor :color

  def initialize(name)
    @name = name
  end

  def play_turn(display)
    comp_pieces = display.board.rows.flatten.select { |piece| piece.color == color }
    possible_moves = []
    comp_pieces.each do |piece|
      piece.valid_moves.each do |to_pos|
        possible_moves << [piece.pos, to_pos]
      end
    end
    possible_moves.sample
  end

end
