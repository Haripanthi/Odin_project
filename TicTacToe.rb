class Game
    attr_reader :board, :player_1, :player_2
    
    @@win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    def initialize
      @board = Board.new
      @player_1 = Player.new("X")
      @player_2 = Player.new("O")
      @winner = nil
      @current_turn = 1
    end
    
    def game_plan
      welcome_message
      play
      results
    end
    
    def welcome_message
      puts "Welcome to TicTacToe!, 
      player_1 is X and player_2 is O."
      @board.print_grid
    end
    
    def play
      player_turn until game_ends
    end
    
    def game_ends
      @current_turn > 9 || @winner
    end
    
    def player_turn
      @current_turn % 2 != 0 ? turn(@player_1) : turn(@player_2)
    end
    
    def turn(player)
      selection = get_valid_cell(player)
      if @board.update_grid(selection, player)
        @current_turn += 1
        
      else
        error = "That grid is not available!!"
      end
      @board.print_grid
      puts error
      check_for_winner(player)
    end
    
    def get_valid_cell(player)
      selection = nil
      until (0..8).include?(selection)
      puts "#{player.marker}: select an empty cell(1-9 from top to bottom, left to right"
      selection = gets.chomp.to_i - 1
      end
    selection
    end
   
   
   def check_for_winner(player)
     @@winning_lines.each do |line|
       @winner = player if line.all? { |a| @board.board[a] == player.marker }
     end
   end
   
   
   def results
     puts "Game over!!"
     if @current_turn > 9 && @winner == nil
       puts "It's a tie"
     else
       puts "Congratulations, #{winner.marker}. Well done!!"
     end
   end
   
    class Board
     attr_reader :board
     
      def initialize
       @empty = " "
       @board = Array.new(9, @empty)
      end
   
     def update_grid(selection, player)
       if @board[selection] == @empty
         @board[selection] = player.marker
         return true
       else
         return false
       end
     end
   
   
      def print_grid
     @board.each_slice(3) { |row| puts row.join(" | ")}
      end
    end
   
   
  Player = Struct.new(:marker)
end
   
   game = Game.new
   game.game_plan
   