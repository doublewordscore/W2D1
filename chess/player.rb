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
