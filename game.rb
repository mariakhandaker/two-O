require_relative './player'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
  end

  def question
    question_for = @players.first
    a = rand(20) + 1
    b = rand(20) + 1
    c = a + b
    puts "#{question_for.name}: What does #{a} plus #{b} equal?"
    answer = gets.chomp.to_i
    
    if (answer != c)
      @players.first.wrong
      puts 'no!!!!'
    else
      puts 'yes!!!'
    end   
    @players.rotate! 
  end

  def score
    @players.each{|player| puts "#{player.name}: #{player.lives}/3"}   
  end

  def winner
    winner = @players.find{|player| !player.dead?}
    puts "The winner is #{winner.name} with a score of #{winner.lives}"
  end

  def game_over?
    @players.select{|player| player.dead?}.count > 0
  end

  def play
    until (game_over?) do
      question
      score
    end
    winner
  end 
  
end