#!/usr/bin/ruby

out = ""
Dir.chdir ARGV[0]
Dir.glob("*.snippet").sort.each do |e|
  out << "snippet #{e.sub '.snippet', ''}\n"
  File.open e do |f|
    f.each_line {|l| out << "\t#{l}"}
  end
end

puts out
