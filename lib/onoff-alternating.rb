# onoff.rb
# this will make your hue begin to alternate between a random color and the off state

require 'hue'

# set up hue client
client = Hue::Client.new

client.lights.each do |light|
  light.on!
end

# set these variables to whatever you want them to be
wake_time = 2 # time to wait before changing color again in seconds
rest_time = 2 # time to go dark

puts "\n------------------\nRest time: #{rest_time}s\nWake time: #{wake_time}s\n------------------"

while true
  client.lights.each do |light|
    randhue = rand(Hue::Light::HUE_RANGE)
    puts "\n------------------\nHue: #{randhue}\n------------------"

    light.on!
    light.set_state({:hue => randhue}, 0)
  end

  sleep wake_time

  client.lights.each do |light|
    light.off!
  end

  sleep rest_time
end
