#!/usr/bin/env ruby
require 'optparse'

by_author = {}
Dir.chdir("/sw/tools/smithy/formulas")
untracked = `git ls-files --others --exclude-standard`.split("\n")
untracked.each do |f|
	author = `ls -AhlF #{f}`.split(" ")[2]
	author_info = `finger -s #{author}`.split("\n")[1].split(" ")
	author_name = "#{author_info[1]} #{author_info[2]}"
	by_author[author_name] ||= []
	by_author[author_name] << f
end

by_author.keys.each do |author_name|
	puts author_name + ":"
	by_author[author_name].each do |f|
		puts "\t#{f}"
	end
end
