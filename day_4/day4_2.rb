def overlap?(pair)
    s_1, e_1 = pair.first
    s_2, e_2 = pair.last
   
   no_intersect = e_1 < s_2 || e_2 < s_1
   !no_intersect
end

puts File.readlines('input.txt')
    .map(&:strip)
    .map{|line| line.split(",")} #[[a-b , c-d],[a-b , c-d]]
    .map{|pair| pair.map{|range| range.split("-").map(&:to_i)}}
    .select{|pair| overlap?(pair)}
    .count

