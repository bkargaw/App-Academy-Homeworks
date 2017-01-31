require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...14).each do |i|
      if i == 13 || i == 6
        @cups[i] = []
      else
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !start_pos.between?(0, 13)
    raise 'Invalid starting cup' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # byebug
    stones = @cups[start_pos]
    @cups[start_pos] = []
    @player1 == current_player_name ? cup_to_skip = 13 : cup_to_skip = 6
    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i == 14
      @cups[ i ] << stones.pop unless i == cup_to_skip

    end
    render
    next_turn(i )
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    # byebug
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
        :switch
    else
      ending_cup_idx
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
    return true if cups.take(6).map(&:empty?).all?
    return true if cups[7..12].map(&:empty?).all?
    false
  end

  def winner
    case cups[6] <=> cups[13]
    when -1
      return @palyer2
    when 0
      return :draw
    when 1
      return @player1
    end
  end
end
