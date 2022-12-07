def downcase?(char) char.downcase == char; end

def char_points(char)
    if downcase?(char)
        char.ord - 96
    else
        char.ord - 64 + 26
    end
end

x =  File.readlines('input.txt')
    .map(&:strip)
    .map{|line| line.chars.each_slice(line.length/2).to_a}
    .map{|pair| pair.first.intersection(pair.last)}
    .flatten
    .map{|char| char_points(char)}
    .sum
puts x