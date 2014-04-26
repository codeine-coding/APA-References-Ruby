class Author
	$authors = Array.new
	def initialize(first, middle, last)
		@first = first[0].capitalize
		@middle = middle[0].capitalize
		@last = last.capitalize
		@name = "#{@last}, #{@middle}. #{@first}."
		$authors << @name
	end

	def transform
		@name
	end

	def self.all
		$authors.collect { |a|
			if a != $authors.last
				"#{a}, "
			elsif a == $authors.last && a != $authors.first
				"& #{a}"
			elsif a == $authors.first
				"#{a}"
			end
		}.join
	end
end

class Journal
	$journal = Array.new
	def initialize(article_title, journal_title, year, volume, issue, page_start, page_end )
		@article_title = article_title.capitalize
		@journal_title = journal_title
		@year          = year.to_s
		@volume        = volume.to_s
		@issue         = issue.to_s
		@page_start    = page_start.to_s
		@page_end      = page_end.to_s
		@pages         = "#{page_start}-#{page_end}"
		@format = "(#{@year}). #{@article_title}. #{@journal_title}, #{@volume}(#{@issue}), #{@pages}"
		$journal << @format
	end

	def transform
		@format
	end

	def self.all
		$journal.join
	end

end

class Reference
	$references = Array.new
	def initialize(author, journal)
		@author = author
		@journal = journal
		@full_reference = "#{@author} #{@journal}"
		$references << @full_reference
	end

	def self.all
		$references.collect { |r|
			"\n#{r}\n"
		}
	end
end

puts
puts 'APA FORMATTER'
loop do
	print "\nCreate new reference? "
	answer = gets.chomp.downcase
	if answer == 'yes'
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

		print "What is the article's title? "
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
	else
		print 'File name? '
		filename = gets.chomp.downcase
		File.open("#{filename}.txt", 'w') { |f|
			f.puts "Work Cited"
			f.puts Reference.all
		}
		break
	end
end
