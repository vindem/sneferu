require 'pentry.rb'
class Playlist < Array
	def initialize()
		super				
	end

	def escape_path(path)
		path.gsub!(" ",'\\ ');
		path.gsub!("(",'\\(');
		path.gsub!(")",'\\)');
		path.gsub!("\'","\\'");
		return path;
	end


	def createFromDir(path)
		Dir.foreach(path) { |file| if(file.include? '.mp3') then push PlaylistEntry.new(escape_path(path+file)) end }
	end

	def shuffle!
		size.downto(1) { |n| push delete_at(rand(n)) }
		self
	end
end
