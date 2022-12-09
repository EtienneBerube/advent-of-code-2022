packet = File.read('test.txt')
puts packet.chars
    .each_with_index
    .map{ |_, i| packet.slice(i, 14).chars.uniq.count == 14 } 
    .find_index(true) + 14