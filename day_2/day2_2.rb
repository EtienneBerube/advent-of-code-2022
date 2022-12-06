THEIR_MOVES = {
    "a" => :rock,
    "b" => :paper,
    "c" => :scissors, 
}

OUTCOME = {
    "x" => :loose,
    "y" => :draw,
    "z" => :win,
}

RULES = {
    :rock => :scissors,
    :paper => :rock,
    :scissors => :paper,
}

OUTCOME_SCORE = {
    :win => 6,
    :draw => 3,
    :loose => 0,
}

MOVE_SCORE = {
    :rock => 1,
    :paper => 2,
    :scissors => 3,
}

def main!
    strat = File.readlines('input.txt')
        .map(&:strip)
        .map(&:downcase)
        .map{|line| line.split(" ")}
        .map{|line| [THEIR_MOVES[line.first], OUTCOME[line.last]]}
        .map{|line| points(line.first, line.last)}
        .sum
    puts strat
end

def points(their, outcome)
    our_move = case outcome
        when :win
            RULES.invert[their]
        when :draw
            their
        when :loose
            RULES[their]
    end
    OUTCOME_SCORE[outcome] + MOVE_SCORE[our_move]
end


# DONT TOUCH
main!