packet = File.read('test.txt')
puts packet.chars
    .each_with_index
    .map{|_, i| packet.slice(i, 4).chars.uniq.count == 4} 
    .find_index(true) + 4