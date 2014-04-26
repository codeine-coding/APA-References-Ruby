class Author
	$instances = Array.new
	def initialize(first, middle, last)
		@first = first[0].capitalize
		@middle = middle[0].capitalize
		@last = last
		@name = "#{@last}, #{@middle}. #{@first}."
		$instances << @name
	end

	def transform
		@name
	end

	def self.all
		$instances.each { |i|
		print i, ', '
		}
	end
end

class Journal

	def initialize(article_title, journal_title, year, volume, issue, page_start, page_end )
		@article_title = article_title.capitalize
		@journal_title = journal_title
		@year          = year.to_s
		@volume        = volume.to_s
		@issue         = issue.to_s
		@page_start    = page_start.to_s
		@page_end      = page_end.to_s
		@pages         = "#{page_start} - #{page_end}"
		@format = "(#{@year}). #{@article_title}. #{@journal_title}, #{@volume}(#{@issue}), #{@pages}"
	end

	def transform
		@format
	end
end

Author.new('John', 'Something', 'Doe').transform
Author.new('Jane', 'Something', 'Smith').transform
a = 'Sample Article Title for an actual research project done by someone cool'
j = 'Journal of Awesome'
y = 2014
v = 4
i = 15
ps = 322
pe = 333
journal = Journal.new(a,j,y,v,i,ps,pe).transform

"#{Author.all} #{print journal}"
# Doe, S. J. (2014). Sample article title for an actual research project done by someone cool.
# Journal of Awesome, 4(15), 322 - 333
