# require 'daru'

# board = Daru::DataFrame.new(
#     {
#       "1" => [{filled?:"false", space:" O "},{filled?:"false", space:" O "},{filled?:"false", space:" O "}],
#       "2" => [{filled?:"false", space:" O "},{filled?:"false", space:" O "},{filled?:"false", space:" O "}],
#       "3" => [{filled?:"false", space:" O "},{filled?:"false", space:" O "},{filled?:"false", space:" O "}]
#     },
#      index: ["1", "2", "3"]
#    )

# puts board

require 'matrix'

board = Matrix[
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 1
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 2
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 3
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 4
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 5
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 6
        [{filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}, {filled?:"false", space:" O "}], #columna 7
]

board.transpose().each do |row|
    puts ""
    row.each do |slot|
        print slot[:space]
    end
end
