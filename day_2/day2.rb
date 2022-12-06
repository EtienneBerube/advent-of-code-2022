THEIR_MOVES = {
    "a" => :rock,
    "b" => :paper,
    "c" => :scissors, 
}

OUR_MOVES = {
    "x" => :rock,
    "y" => :paper,
    "z" => :scissors,
}

RULES = {
    :rock => :scissors,
    :paper => :rock,
    :scissors => :paper,
}

SCORES = {
    :rock => 1,
    :paper => 2,
    :scissors => 3,
}

def main!
    strat = File.readlines('input.txt')
        .map(&:strip)
        .map(&:downcase)
        .map{|line| line.split(" ")}
        .map{|line| [THEIR_MOVES[line.first], OUR_MOVES[line.last]]}
        .map{|line| points(line.last, line.first)}
        .sum
    puts strat
end

def win?(our, their) RULES[our] == their; end
def lose?(our, their) RULES[their] == our; end
def draw?(our, their) our == their; end

def points(our, their)
    game_p =  if win?(our, their)
            6
        elsif draw?(our, their)
            3
        else
            0
        end
        
    move_p = SCORES[our]
    game_p + move_p
end


# DONT TOUCH
main!