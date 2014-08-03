# that line isn't actually to run this file, it's to trick ide's to make it a ruby syntax (where available).
#!/usr/bin/ruby 

# lets load our helpers.
load 'guards/helpers.rb'

# the list of modules we want to include, individually tuned.
modules = ['bundle', 'rspec', 'shell']

modules.each do |f|
  eval open("guards/#{f}.rb").read
end
