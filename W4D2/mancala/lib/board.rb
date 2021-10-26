class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new() }
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      if idx != 6 && idx != 13
        @cups[idx] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos.between?(0,5) || start_pos.between?(7,12)
      if cups[start_pos].empty?
        raise "Starting cup is empty"
      end
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)

    idx_end = nil

    stones = cups[start_pos].length
    cups[start_pos] = []

    i = start_pos
    while stones > 0
      i += 1
      if i > 13
        i = 0
      end
      
      if current_player_name == @player1
        if i != 13
          idx_end = i
          cups[i] << :stone
          stones -= 1
        end
      elsif i != 6
          idx_end = i
          cups[i] << :stone
          stones -= 1
      end
    end

    render
    next_turn(idx_end)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end
    if cups[ending_cup_idx].length == 1
      return :switch
    end
    if cups[ending_cup_idx].length > 1
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..6].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    if cups[6].length > cups[13].length
      return @player1
    elsif cups[6].length < cups[13].length
      return @player2
    else
      return :draw
    end

  end
end
