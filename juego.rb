
require_relative ('jugador.rb')
require_relative ('tablero.rb')

class Game
    attr_accessor :current_player
    attr_accessor :board

    def initialize
        @board = Board.new
        @player1 = Player.new("Azul", " 🔵 ", @board)
        @player2 = Player.new("Rojo", " 🔴 ", @board)
        @current_player = @player1
        # @players = [@player1, @player2]
        play_game
    end

    def change_turns(current_player)
        # current_player_index = @players.index(current_player)
        # next_player = @players[current_player_index + 1]
        if current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
        # puts "current player index: #{current_player_index}"
        # puts "next player: #{@players[current_player_index + 1].color}"
        # @current_player == @player1 ? @current_player == @player2 : @current_player == @player1
    end

    def play_game
        @board.display
        loop do
            #get user input
            player_col_number = @current_player.get_player_column
            puts "column number = #{player_col_number}"

            if (1..7) === player_col_number
                #fill corresponding slot/update board
                player_slot = @board.get_first_empty_slot_index(player_col_number)
                    puts "slot = #{player_slot + 1}"
                @board.fill_slot(player_col_number, player_slot, @current_player.piece)
                #display win or draw
                # display_win if @board.four_in_a_column(@current_player.piece)
                puts ""
                puts "4-in-a-column? #{@board.four_in_a_column?(@current_player.piece)}"
                puts "# of pieces in column: #{@board.pieces_in_a_column(@current_player.piece)}"

                puts "4-in-a-row? #{@board.four_in_a_row?(@current_player.piece)}"
                puts "# of pieces in row: #{@board.pieces_in_a_row(@current_player.piece)}"

                puts "victory?: #{@board.victory?(@current_player.piece)}"

                @board.display
                # display_win if @board.victory?(@current_player.piece)
                # display_draw if @board.draw?

                #change turns
                change_turns(@current_player)
                puts "current player: #{@current_player.color}"

            else
                @board.display
                puts ""
                puts "Escoge un numero del 1 al 7 por favor"
            end
            # @current_player = @player2
        end
    end

    def display_win
        puts "#{@current_player.color}#{@current_player.piece}gana!" 
    end

    def display_draw
        puts "Empatados!"
    end


end

Game.new
