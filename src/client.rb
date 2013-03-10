require_relative 'xmpp4r-simple.rb'

jabber = Jabber::Simple.new(user, pass)
unless !jabber.connected?
	puts "Connected!"
	puts "Messages: "
	Thread.new do
		loop do
			break unless STDIN.gets == 'exit'
		end
		exit
	end

	loop do
		if jabber.received_messages?
			jabber.received_messages.each do |message|
				puts message
			end
		end
	end
end
