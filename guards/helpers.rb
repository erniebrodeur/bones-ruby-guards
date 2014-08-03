# Safely make a shell variable for my configs.  upcases everything to reduce collisions.
def env_var(name, value)
	ENV[name.to_s.upcase] = value unless ENV[name.to_s.upcase]
end