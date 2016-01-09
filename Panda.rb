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

	def hash
		to_s.hash
	end

	def ==(other)
		hash == other.hash
	end

	def self.to_o(string)
		data = string.split(' ')
    Panda.new(data[0], data[1], data[2])
	end
end
