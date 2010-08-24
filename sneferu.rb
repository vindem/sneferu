require 'playlist.rb'
require 'lib/mplayer-process.rb'

class Player

def initialize
	@plist = Playlist.new
	@curr = @plist.first
	@curr_idx = 0;
end

def process(input)
	val = input.split(" ")
	case val[0]
		when 'q'
			if @player != nil then
				@player.quit	
			end
			Process.exit
		when 'n'
			
		when 'b'

		when 'p'
			Thread.new do
				if val[1] != nil then
					@player = MPlayerProcess.new(val[1])
				else
					puts 'Missing file'
				end
			end
		when 'd'
			if val[1]!=nil then
				$plist.createFromDir(val[1])
				if val[2] == '-s' then $plist = plist.shuffle end
				Thread.new do
					if $player == nil then
					end
				end
				puts "End loading"
			else
				puts 'Missing path'
			end
		when 'r'
		when 's'
		when 'pp'
			puts plist.inspect
		when 'pa'
		end
end
end

pl = Player.new
print "sneferu# "
while input=gets
	pl.process input
	print "sneferu# "
end
