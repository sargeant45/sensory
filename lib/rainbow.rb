# sensory.rb
# fade between random colors

require 'hue'

# set up hue client
client = Hue::Client.new

client.lights.each do |light|
  light.on!
end

# set these variables to whatever you want them to be
sleep_time = 1 # time to wait before changing color again in seconds
rhue = 0

puts "\n------------------\nRest time: #{sleep_time}\n------------------"

while true
  # randomized attributes
  if rhue >= 65535
    rhue = 0
  end

  rhue += 5000

  puts "\n------------------\nHue: #{rhue}\n------------------"

  client.lights.each do |light|
    light.set_state({:hue => rhue}, 1)
  end

  sleep sleep_time
end
