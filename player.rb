require File.join(File.dirname(__FILE__),'.','lib','mplayer-ruby')
class Player
	def initialize(playlist)
		@player = nil;
		@playlist = playlist;
	end

	def play
		@player = MPlayer::Slave.new @playlist.first.path, :path => '/usr/bin/mplayer'
		@playlist.each { |entry| @player.load_file entry.path, :append ; sleep(10); puts entry.path }
	end

	def pause
		if(@player != nil)
		then
			puts player.pause
		end
	end

	def get(value)
		if(@player != nil)
		then
			player.get value
		end
	end
	
	def showinfo()
		if(@player != nil)
		then
			puts (player.get :meta_title) + " - " + (player.get :meta_artist)
		end
	end

	def quit()
		if(@player != nil)
		then
			player.quit
		end
	end
end
