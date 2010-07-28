#!/usr/bin/env ruby
require "fileutils"

REMOTE ="/home/phtrivier/prj/ph.on.things.free.fr/projects/jsube/game"

LOCAL="/home/phtrivier/prj/jsube"

FileUtils.mkdir_p("#{REMOTE}/src/js")
FileUtils.mkdir_p("#{REMOTE}/data")

FileUtils.cp_r("#{LOCAL}/data", REMOTE)
FileUtils.cp_r("#{LOCAL}/src/css", "#{REMOTE}/src")
FileUtils.cp_r("#{LOCAL}/src/html", "#{REMOTE}/src")
FileUtils.cp_r(Dir.glob("/#{LOCAL}/src/js/*.js"), "#{REMOTE}/src/js")

system("weex -t Free")
print("Are you happy with weex output (y/N) ? ")
answer = gets.chomp
if (answer == "Y" || answer == "y")
  system("weex Free")
else
  puts("Week aborted")
end
