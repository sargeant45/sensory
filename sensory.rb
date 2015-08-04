require 'hue'

# set up hue client
client = Hue::Client.new

client.lights.each do |light|
  light.on!
end


while true
  # randomized attributes
  randhue = rand(Hue::Light::HUE_RANGE)

  # set these variables to whatever you want them to be
  transition_time = 10 * 2 # transition speed in 1/10s
  sleep_time = 2 # time to wait before changing color again in seconds

  puts "\n------------------\nHue: #{randhue}\n------------------"

  client.lights.each do |light|
    light.set_state({:hue => randhue}, transition_time)
  end

  sleep sleep_time
end
