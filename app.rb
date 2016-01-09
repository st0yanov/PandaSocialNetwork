require_relative 'PandaSocialNetwork'

network = PandaSocialNetwork::load('social_network.db')

ivo = network.find_panda('Ivo ivo@pandamail.com male')
rado = network.find_panda('Rado rado@pandamail.com male')
tony = network.find_panda('Tony tony@pandamail.com female')

p network.connection_level(ivo, rado) == 1 # true
p network.connection_level(ivo, tony) == 2 # true

p network.how_many_gender_in_network(1, rado, "female") == 1 # true
