require_relative '../lib/xmpp4r-simple/lib/xmpp4r-simple.rb'
require 'rubygems'
require 'json'

json = File.read('../config/config.json')
config = JSON.parse(json)

jabber = Jabber::Simple.new(config["user"], config["pass"])
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
