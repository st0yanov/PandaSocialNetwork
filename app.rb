require_relative 'PandaSocialNetwork'

#network = PandaSocialNetwork::load('social_network.db')

#ivo = network.find_panda('Ivo ivo@pandamail.com male')
#rado = network.find_panda('Rado rado@pandamail.com male')
#tony = network.find_panda('Tony tony@pandamail.com female')

#p network.connection_level(ivo, rado) == 1 # true
#p network.connection_level(ivo, tony) == 2 # true

#p network.how_many_gender_in_network(1, rado, "female") == 1 # true

#network = PandaSocialNetwork.new
#ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
#rado = Panda.new("Rado", "rado@pandamail.com", "male")
#tony = Panda.new("Tony", "tony@pandamail.com", "female")
#pesho = Panda.new("Pesho", "pesho@pandamail.com", "male")

#network.add_panda(ivo)
#network.add_panda(rado)
#network.add_panda(tony)
#network.add_panda(pesho)

#network.make_friends(ivo, rado)
#network.make_friends(rado, tony)
#network.make_friends(pesho, ivo)
#network.make_friends(pesho, rado)

#p network.connection_level(ivo, pesho)

#network.save('database.yaml', YAMLDatabase)

#network.connection_level(ivo, rado) == 1 # true
#network.connection_level(ivo, tony) == 2 # true

#network.how_many_gender_in_network(1, rado, "female") == 1 # true

network = PandaSocialNetwork::load('database.yaml', YAMLDatabase)
p network
