require_relative ('tablero.rb')

class Player
    attr_accessor :color, :piece, :board

    def initialize(color, piece, board)
        @color = color
        @piece = piece
        @board = board
    end

    def get_player_column
        puts ""
        puts "#{@color}#{piece}, en qué columna deseas poner tu pieza?"
        player_column = gets.to_i
    end

end
