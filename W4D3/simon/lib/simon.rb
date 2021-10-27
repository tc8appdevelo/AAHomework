class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    rs = require_sequence
    if rs
      round_success_message
    else
      return
    end
    sleep(2)
    20.times { puts "." }
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(2)
      20.times { puts "-" }
    end
  end

  def require_sequence
    (0...seq.length).each do |i|
      player_input = gets.chomp
      if player_input != seq[i]
        @game_over = true
        return false
      end
    end
    true
  end

  def add_random_color
    seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "round successful"
  end

  def game_over_message
    puts "game over"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

# game = Simon.new
# game.play