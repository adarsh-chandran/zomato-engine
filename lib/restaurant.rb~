require 'support/number_helper'
class Restaurant

include NumberHelper

@@file_location = nil

attr_accessor :name, :cuisine, :rate

	def self.file_loc(path = nil)
	#creating this method since @@file_location cannot be accessed by guide.rb directly
	@@file_location = File.join(APP_ROOT,path)	
	end
	
	def self.file_exist?
	#method to know if restaurant exist
	if @file_location && File.exists?(@@file_location)
	return true
	else
	return false
	end
	end

	def self.file_usable?
	#A better method than file.exist?. This method returns true only if
	#the file exist, readable and writable.
	return false unless File.exists?(@@file_location)
	return false unless File.readable?(@@file_location)
	return false unless File.writable?(@@file_location)
	return true
	end

	def self.create_file
	#method to create restaurant
	File.open(@@file_location, 'w') unless file_exist?
	return file_usable?
	end

	def self.saved_restaurant
	#method to read the saved restaurant file
	restaurants = []
	file = File.new(@@file_location, 'r')
	file.each_line do |line|
	restaurants << Restaurant.new.import_line(line.chomp)
	end
	file.close
	restaurants
	end	


	def self.build_yourself
	puts "\nAdd a new Restaurant\n\n".upcase

	print "Restaurant Name: "
	@name = gets.chomp.strip

	print "Cuisine: "
	@cuisine = gets.chomp.strip

	print "Average Price: "
	@rate = gets.chomp.strip

	end

	def save
	return false unless Restaurant.file_usable?
	File.open(@@file_location, 'a') do |file|
	file.write "#{[@name, @cuisine, @rate].join("\t")}\n"
	end
	return true
	end

	def formatted_rate
	number_to_currency(@rate)
	end

	def import_line(line)
	splitted_line = line.split("\t")
	@name, @cuisine, @rate = splitted_line
	return self
	end
	

end
