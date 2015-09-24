def init
  puts "header!"
  puts object.inspect
  super

  sections.push :header
  sections.push :functions
rescue => error
  puts error
end
