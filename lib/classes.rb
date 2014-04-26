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
