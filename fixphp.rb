#!/usr/bin/env ruby

# PHP file tag fixer by K3A.me
# Changes <? to <?php in each file

abort("Usage: fixphp.rb <path_to_a_folder>") if ARGV.length == 0

Dir[ARGV[0]+"/**/*"].each do |fn|
    next if File.directory?(fn)

    puts " * #{fn}"

    begin
        data = File.read(fn).gsub(/<\?\s/, "<?php ")
        File.open(fn, 'w') { |f| f << data }
    rescue
        $stderr.puts " #{$!}"
    end
end
