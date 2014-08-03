
guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})			
  watch(%r{^bin/(.+)\.rb$})			{ |m| "spec/bin/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') 		{ "spec" }
  watch('spec/test_services.json')	{ "spec" }
  watch('spec/mock_tokens.rb')	{ |m| "spec/lib/token_spec.rb" } # I don't use the argument, but without it the spec won't trigger.
end