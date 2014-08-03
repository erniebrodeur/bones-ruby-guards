# Safely make a shell variable for my configs.  upcases everything to reduce collisions.

def env_var(name, value)
	name = name.to_s.upcase
	ENV[name] = value unless ENV[name]
end

