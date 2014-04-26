require_relative 'lib/apa_helper'
apa = APAHelper.new
puts "\nAPA FORMATTER"
loop do
	print "\nCreate new reference? "
	answer = gets.chomp.downcase
	if answer == 'yes'
		apa.author_options
		apa.journal_options
	else
		apa.create_file
		break
	end
end
