# frozen_string_literal: true

require "byebug"


IFile = Struct.new(:name, :size)

def is_number?(str)
    true if Integer(string) rescue false
end

class Directory
  attr_reader :name
  attr_accessor :files, :sub_dirs

  def initialize(name:)
    @name = name
    @files = []
    @sub_dirs = []
  end
end

def dir_size(computer, dir)
    if computer[dir].sub_dirs.empty?
        computer[dir].files.map(&:size).sum 
    else
        computer[dir].files.map(&:size).sum + computer[dir].sub_dirs.map{|sub_dir| dir_size(computer, sub_dir)}.sum    
    end
end

computer = {}

File.read('input.txt').scan(/(\$[^$]+)/m).map(&:first).reduce('/') do |pwd, cmd|
    puts "#{pwd}> #{cmd}"

  cmd, *vals = cmd.split("\n")

  case cmd
  when /\$ cd/
    target = cmd.split(" ").last
    pwd = case target
          when '..'
            t = pwd.split('/').reverse
            t.shift
            pwd = t.reverse.join('/') + "/"
          when '/'
            '/'
          else
            pwd + "#{target}/"
          end
  when /\$ ls/
      byebug if pwd == "//"
      
    computer[pwd] = Directory.new(name: pwd)

    vals.each do |line|
      elems = line.split(' ')
      if /\d/ === elems.first
        computer[pwd].files << IFile.new(elems.last, elems.first.to_i)
      elsif elems.first == 'dir'
        computer[pwd].sub_dirs << "#{pwd}#{elems.last}/"
      end
    end

  end

  pwd
end

dir_sizes = {}

computer.keys.each do |k|
    dir_sizes[k] = 0
end

dir_sizes.keys.each do |dir|
    dir_sizes[dir] = dir_size(computer, dir)
end

ok_dirs =  dir_sizes.select {|k, v| v <= 100000} 

# names
puts ok_dirs.keys.inspect
# sum
puts ok_dirs.values.sum
