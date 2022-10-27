class Game
  @@attempts = 12
  @@hints = ''
  @@game_over = false
  @@guess = ''
  @@password = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join('').to_i

  def self.start_game
    puts "Welcome to a Mastermind game simulation on the terminal!\n\n"
    puts 'Try to guess the 4-digit password, consisting of numbers ranging from 1 to 6.'
    puts "\n"
    puts "Read the README.md for a synopsis of the rules.\n"
    play_game
  end

  private_class_method def self.reset_hints
    @@hints = ''
  end

  private_class_method def self.hint_provider
    @@guess.to_s.split('').each_with_index do |num, index|
      @@password.to_s.split('').each_with_index do |number, indx|
        @@hints += 'E' if num == number && index == indx
      end
    end
    if @@password.to_s.split('').include?(@@guess.to_s.split('')[0])
      @@hints += 'P'
    elsif @@password.to_s.split('').include?(@@guess.to_s.split('')[1])
      @@hints += 'P'
    elsif @@password.to_s.split('').include?(@@guess.to_s.split('')[2])
      @@hints += 'P'
    elsif @@password.to_s.split('').include?(@@guess.to_s.split('')[3])
      @@hints += 'P'
    end
    p @@hints
  end

  private_class_method def self.guess_checker
    if @@guess.to_s.length != 4 || @@guess.to_s.include?('7') || @@guess.to_s.include?('8') || @@guess.to_s.include?('9') || @@guess.to_s.include?('0')
      puts 'Invalid input, try again...'
      play_game
    end
  end

  private_class_method def self.no_more_attempts
    if @@attempts <= 0
      @@game_over = true
      puts 'You lose...'
    end
  end

  private_class_method def self.play_game
    puts 'Take a guess.'
    while @@game_over == false
      @@guess = gets.chomp.to_i
      guess_checker
      game_progress
      reset_hints
      no_more_attempts
    end
  end

  private_class_method def self.game_progress
    while @@attempts >= 0 && @@game_over == false
      if @@guess == @@password
        puts 'You did it! You cracked the code!!'
        @@game_over = true
      else
        @@attempts -= 1
        puts "\n"
        hint_provider
        puts "\n"
        puts "Not quite. You've got #{@@attempts} attempts left."
        break
      end
    end
  end
end

Game.start_game
