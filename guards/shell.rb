# do we execute our shell command (if triggered).
env_var "EXECUTE_SHELL", "false"

test_cmd = [
  "bundle exec bin/something"
]

guard :shell do 
	watch 'jobs/test.rb' do |m|
		puts "Job: #{m} updated."
		puts `bundle exec bin/GivenThisDoThat --job #{m[0].split(".")[0]}` 
	end
end

guard :shell do
   watch /.*/ do |m|
     next unless ENV["EXECUTE_SHELL"] == "true"
     puts "Time: #{Time.now}, file saved: #{m}"
     test_cmd.each do |cmd|
       puts "=" * 80
       puts "cmd: #{cmd}"
       puts `#{cmd}`
     end
   end
 end