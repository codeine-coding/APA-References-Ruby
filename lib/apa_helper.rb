require_relative 'classes'
class APAHelper

	def author_options
		$authors = []
		$journal = []
		authcount = 0
		until authcount > 0
			print 'How many authors? '
			authcount = gets.chomp.to_i
			if authcount <= 0
				puts 'Author number must be greater 0'
			elsif authcount > 0
				count = 1
				until count == (authcount + 1)
					print "\nWhat is author-#{count}'s first name? "
					first = gets.chomp
					print "What is author's middle initial? "
					middle = gets.chomp
					print "What is author's last name? "
					last = gets.chomp
					Author.new(first, middle, last)
					count += 1
				end
			end
		end
	end

	def journal_options
		print "\nWhat is the article's title? "
		a = gets.chomp
		print "What is the journal's title? "
		j = gets.chomp
		print 'What is the year the article was written? '
		y = gets.chomp
		print 'What is the volume #? '
		v = gets.chomp
		print 'What is the issue #? '
		i = gets.chomp
		print 'What is the start page? '
		ps = gets.chomp
		print 'What is the end page? '
		pe = gets.chomp
		Journal.new(a,j,y,v,i,ps,pe).transform
		Reference.new(Author.all, Journal.all)
	end

	def create_file
		print 'File name? '
		filename = gets.chomp.downcase
		File.open("#{filename}.txt", 'w') { |f|
			f.puts "Work Cited"
			f.puts Reference.all
		}
	end

end