pubnub = Pubnub.new(
    subscribe_key: 'sub-c-6dd7c098-7e9b-11e6-9717-0619f8945a4f',
    publish_key: 'pub-c-becfbd32-c45e-4805-8bd3-cad1bb48de33',
    auth_key: "Inlosol",
    uuid: "ruby"
)   

callback = Pubnub::SubscribeCallback.new(
    message:  ->(envelope) { 
        puts "MESSAGE: #{envelope.result[:data][:publish_time_object][:timetoken]}"
        timestamp = envelope.result[:data][:publish_time_object][:timetoken].to_i
        polled = timestamp/10000000
        polled_at = Time.at(polled).to_datetime
        message = envelope.result[:data][:message]
        Message.create(temperature: message["temperature"], device_id: message["device_id"], polled_at: polled_at.utc)
    },
    presence: ->(envelope) {
        puts "PRESENCE: #{envelope.result[:data]}"
    },
    status:   lambda do |envelope|
        puts "\n\n\n#{envelope.status}\n\n\n"
 
        if envelope.error?
            puts "ERROR! #{envelope.status[:category]}"
        else
            puts 'Connected!' if envelope.status[:last_timetoken] == 0 # Connected!
        end
    end
)

pubnub.add_listener(callback: callback)


pubnub.subscribe(
    channel: 'backfront',
    presence: 'backfront',
    restore: true
)

pubnub.presence(channel: 'backfront')




=begin 

\\]\pubnub.here_now(
    :channel  => 'backfront',
    :callback => lambda { |event_data| puts(event_data) }
)

pubnub.time do |envelope|
    puts envelope.timetoken
end

pubnub.where_now(
  uuid: "ruby"
) do |envelope|
  puts envelope.parsed_response
end 
=end

