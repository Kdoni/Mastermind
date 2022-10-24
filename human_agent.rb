class Game
  @@attempts = 12
  @@hints = ''
  @@game_over = false
  @@guess = ''
  @@password = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join('').to_i
  def self.start_game
    puts "Welcome to a Mastermind game simulation on the terminal!\n\n"
    puts 'Try to guess the 4-digit password, consisting of numbers from 1 to 6.'
    puts "\n"
    puts 'Read the README.md for a synopsis of the rules.'
    play_game
  end

  def self.number_in_number?(outer, inner)
    test = 10**(inner < 2 ? 1 : Math.log10(inner).ceil.to_i)
    while outer >= inner
      return true if ((outer - inner) % test).zero?

      outer /= 10
    end
    false
  end

  def self.guess_checker
    if @@guess.to_s.length != 4 || number_in_number?(@@guess,
                                                     7) || number_in_number?(@@guess,
                                                                             8) || number_in_number?(@@guess,
                                                                                                     9) || number_in_number?(
                                                                                                       @@guess, 0
                                                                                                     )
      puts 'Invalid input, try again...'
      play_game
    end
  end

  def self.play_game
    puts 'Take a guess.'
    @@guess = gets.chomp.to_i
    guess_checker
  end

  #   def self.password
  #     p @@password
  #   end
  def self.guess
    p @@guess
  end
end

Game.start_game