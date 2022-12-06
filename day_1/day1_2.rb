x =  File.readlines('input.txt')
    .map(&:strip)
    .reduce([[]]) do |acc, line|
    if line.empty?
        acc << []
    else
        acc.last << line.to_i
    end
    acc
end.reject{ |n| n.empty? }
.map(&:sum)
.sort

puts x.last(3).sum