require 'player.rb'
require 'playlist.rb'

class Player

def initialize
	plist = Playlist.new
end

def process(input)
	val = input.split(" ")
	case val[0]
		when 'a'
			$player.load_file val[1], :append
		when 'q'
			if $player != nil then
				$player.quit
			end
			Process.exit
		when 'n'
			$player.next 1
		when 'b'
			$player.back 1
		when 'p'
			Thread.new do
				if val[1] != nil then
					$player = MPlayer::Slave.new val[1], :path => '/usr/bin/mplayer'
				else
					puts 'missing file'
				end
			end
		when 'd'
			if val[1]!=nil then
				plist.createFromDir(val[1])
				if val[2] == '-s' then plist = plist.shuffle end
				Thread.new do
					if $player == nil then
						$player = MPlayer::Slave.new plist.first.path, :path => '/usr/bin/mplayer'
					end
					plist.each { 
					     	|entry| $player.load_file entry.path, :append
						sleep(5)
					}
				end
				puts "End loading"
			else
				puts 'Missing path'
			end
		when 'r'
			puts ($player.get :file_name).chomp + " rocks!"
		when 's'
			puts ($player.get :file_name).chomp + " sucks!"
			$player.next 1
		when 'pp'
			puts plist.inspect
		when 'pa'
			$player.pause
		end
end
end

pl = Player.new
print "sneferu# "
while input=gets
	pl.process input
	print "sneferu# "
end
