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
    .each_slice(3)
    .map{|batch| batch.map(&:chars)}
    .map {|batch| batch[0].intersection(batch[1]).intersection(batch[2])}
    .flatten
    .map{|badge| char_points(badge)}
    .sum
puts x