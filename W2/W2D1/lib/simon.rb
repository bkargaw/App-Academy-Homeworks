class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    system "clear"
    add_random_color
    seq.each do |color|
      puts color
      sleep 2
    end
    system "clear"
  end

  def require_sequence
    puts "please repeate the given squence"
    answer = gets.chomp.downcase.split(" ")
    if answer != seq
      @game_over = true
    end
  rescue
    require_sequence
  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "success"
    sleep 1
  end

  def game_over_message
    puts "NOT, failed"
    sleep 2
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
    play
  end
end

game = Simon.new
game.play
