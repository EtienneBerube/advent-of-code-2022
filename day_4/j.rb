count = 0
File.foreach("input.txt") do |line|
    elf_pair = line.chomp.split(",")
    elf_pair = elf_pair.map do |elf|
        start, finish = elf.split("-")
        (start..finish).to_a
    end
    count += 1 if elf_pair.first.intersect?(elf_pair.last)
end

puts count