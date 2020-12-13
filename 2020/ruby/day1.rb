module Day1
  class Problem1
    def self.parse(text)
      text.strip.split.map(&:to_i)
    end
    def initialize(text = nil)
      @text = text ? text : "1721\n979\n366\n299\n675\n1456"
    end
    def part1
      entries = self.class.parse(@text)
      entries.map do |x|
        ys = entries.reject {|e| e == x}.filter {|y| x + y == 2020}
        ys.length == 1 ? [x, ys[0]] : nil
      end.compact[0].reduce(:*)
    end
    def part2
      entries = self.class.parse(@text)
      entries.map do |x|
        entries.reject {|e| e == x}.map do |y|
          zs = entries.reject {|e| e == y}.filter {|z| x + y + z == 2020}
          zs.length == 1 ? [x, y, zs[0]] : nil
        end.compact
      end.filter {|e| e.length > 0}[0][0].reduce(:*)
    end
  end
end

if $0 == __FILE__
  example = Day1::Problem1.new
  puts example.part1
  puts example.part2

  File.open("./day1.input", "r") do |f|
    puzzle = Day1::Problem1.new(f.read)
    puts puzzle.part1
    puts puzzle.part2
  end
end
