

class Board
    attr_accessor :board
    attr_accessor :current_player

    def initialize
        @board = [
            [{filled?:false, space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 1
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 2
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 3
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 4
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 5
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 6
            [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 7
        ]
    end

    def display
        @board.transpose().each do |row|
            puts ""
            row.each do |slot| 
                print slot[:space]
            end
        end
    end


    def get_first_empty_slot_index(col_number)
        #find column array
        selected_col = board[col_number - 1]
        #iterate over each slot hash in column array
        selected_col.each_with_index do |slot, index|
            #to find out which one is the first empty slot in array
            if slot[:filled?] == "false"
                #and return its index
                return index
            end
        end
        return -1
    end

    def fill_slot(col_number, desired_slot_index, piece)
        #find column array
        selected_col_array = @board[col_number - 1]
        #find slot hash
        desired_slot_hash = selected_col_array[desired_slot_index]
        #set slot hash new values
        desired_slot_hash[:filled?] = "true"
        desired_slot_hash[:space] = "#{piece}"
        # puts desired_slot_hash
    end

    # def four_in_a_row?(piece)
    #     @board.each_with_index do |column, index|
    #         while index <= 3 do
    #             column.each_with_index do |slot, index|
    #                 if slot[:space] == "#{piece}" && column[index + 1][:space] == "#{piece}" && column[index + 2][:space] == "#{piece}" && column[index + 3][:space] == "#{piece}"
    #                     return true
    #                 else
    #                     return false
    #                 end
    #             end
    #         end
    #     end
    # end
        

    def pieces_in_a_column(piece)
        pieces_in_a_column = 0
        @board.each_with_index do |column, index|
            # get previous slot
            previous_slot = column[index - 1]
            column.each do |slot|
            #check iff current and previous slot have current player's piece
                if slot[:space] == "#{piece}" && previous_slot[:space] == "#{piece}"
                    #iff so, add 1 piece to counter
                    pieces_in_a_column += 1
                end
            end
        end
        return pieces_in_a_column
    end

    def four_in_a_column?(piece)
        if pieces_in_a_column(piece) >= 4
            return true 
        else
            return false
        end
    end

    def pieces_in_a_row(piece)
        pieces_in_a_row = 0
        @board.transpose().each_with_index do |row, index|
            previous_slot = row[index - 1]
            row.each do |slot|
                if slot[:space] == "#{piece}" && previous_slot[:space] == "#{piece}"
                    pieces_in_a_row += 1
                end
            end
        end
        return pieces_in_a_row
    end


    def four_in_a_row?(piece)
        if pieces_in_a_row(piece) >= 4
            return true 
        else
            return false
        end
    end

    def four_in_a_diagonal?(piece)
    end

    def victory?(piece)
        if four_in_a_diagonal?(piece) || four_in_a_row?(piece) || four_in_a_column?(piece)
            return true
        else
            return false
        end
    end

    def draw?
        #check each column
        @board.each do |column|
            #are there any empty slots?
            if column.any? {|slot| slot[:space] == " O "}
                #if so, no draw yet, return false
                return false
            else
                return true
            end
        end
    end
end


# board = Board.new
# board.display

#  board.fill_slot(3,0, " 🔴 " )