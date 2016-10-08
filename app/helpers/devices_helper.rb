module DevicesHelper
	def temperature_data
		messages = []
		@device.messages.each do |msg| messages<< {temp: msg.temperature, date: msg.polled_at}  end
		messages.to_json
	end

	def current_device
		@device.to_json
	end
end
