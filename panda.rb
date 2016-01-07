class Panda
	attr_accessor :name, :email, :gender

	def initialize(name, email, gender)
		@name, @email, @gender = name, email, gender
	end

	def male?
		gender == "male"
	end

	def female?
		gender == "female"
	end

	def to_s
		"#{name} #{email} #{gender}"
	end

	def to_h
		{name: name, email: email, gender: gender}
	end

	def ==(other)
		name == other.name and email == other.email and gender == other.gender
	end

end

ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo2 = Panda.new("Ivo", "ivo@pandamail.com", "male")
puts ivo == ivo2