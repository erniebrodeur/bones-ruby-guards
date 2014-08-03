#!/usr/bin/ruby 

# lets load our helpers.
load 'guards/helpers.rb'

# do we execute our shell command (if triggered).
env_var "EXECUTE_SHELL", "false"

# that line isn't actually to run this file, it's to trick ide's to make it a ruby syntax (where available).
test_cmd = [
  "bundle exec bin/something"
]

guard :bundler do
	watch 'Gemfile'
	watch '*.gemspec'
end

guard :shell do 
	watch 'jobs/test.rb' do |m|
		puts "Job: #{m} updated."
		puts `bundle exec bin/GivenThisDoThat --job #{m[0].split(".")[0]}` 
	end
end

guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})			
  watch(%r{^bin/(.+)\.rb$})			{ |m| "spec/bin/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') 		{ "spec" }
  watch('spec/test_services.json')	{ "spec" }
  watch('spec/mock_tokens.rb')	{ |m| "spec/lib/token_spec.rb" } # I don't use the argument, but without it the spec won't trigger.
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

# coverage
guard 'livereload' do
	watch "coverage/index.html"
end