require 'open4'

class MPlayerProcess
	
	def initialize(filename)
		@pid,@stdin,@stdout,@stderr = Open4.popen4('/usr/bin/mplayer -slave -quiet ' + filename)
		until @stdout.gets.inspect =~ /playback/ do
		end #fast forward to the desired output
	end

	def send(command)
		@stdin.puts(command)
		response = @stdout.gets
      		until response =~ //
        		response = @stdout.gets
     		end
		response.gsub("\e[A\r\e[K","")
		@stdin.close
	end

	def pid()
		@pid
	end

	def wait()
		Process.waitpid(@pid)
	end

	def quit()
		send('quit')
	end
end
