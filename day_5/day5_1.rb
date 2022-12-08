require "byebug"

class Yard
    def initialize( matrix)
        @board =  matrix
    end
    
    def move(amount:, from:, to:)
        @board[to-1].concat(@board[from-1].pop(amount).reverse)
    end
    
    def to_s
        @board.inspect
    end
    
    def peak
        @board.map(&:last).join
    end
end

# correct
def build_shipment_yard(str_stack)
    num_cols = str_stack.split("\n").last.chomp.split(" ").last.to_i
    lines =  str_stack.split("\n")
    lines.pop
    
    crates = build_crates(num_cols, lines)
    
    Yard.new(crates)
end

# correct
def build_crates(num_cols, str_matrix)
    matrix = []

    num_cols.times do
        matrix << []
    end
    
    str_matrix.reverse.each do |line|
        line.chars.each_with_index do |char, index|
            if char == "["
                pos = index / 4
                matrix[pos] << line[index+1]
            end
        end
    end
    
    matrix
end


def process_moves(procedure, board)
    procedure.split("\n").each do |line|
        /move (\d+) from (\d+) to (\d+)/.match(line)
        board.move(amount: $1.to_i, from: $2.to_i, to: $3.to_i)
    end
end

# correct
def main!
    stack , procedure =  File.read('input.txt')
        .split("\n\n")
    
    yard = build_shipment_yard(stack)
    puts yard
    
    puts "working ... "
    process_moves(procedure, yard)
    
    puts yard.peak
end


main!