# sensory-alternating.rb
# fade between random colors, different on each bulb

require 'hue'

# set up hue client
client = Hue::Client.new

client.lights.each do |light|
  light.on!
end

# set these variables to whatever you want them to be
transition_time = 5 * 2 # transition speed in 1/10s
sleep_time = 2 # time to wait before changing color again in seconds

puts "\n------------------\nTransition time: #{transition_time}/10s\nRest time: #{sleep_time}\n------------------"

while true
  client.lights.each do |light|
    # randomized attributes
    randhue = rand(Hue::Light::HUE_RANGE)
    puts "\n-----------------------------------\nHue on '#{light.name}': #{randhue}\n-----------------------------------"

    light.set_state({:hue => randhue}, transition_time)
  end

  sleep sleep_time
end
