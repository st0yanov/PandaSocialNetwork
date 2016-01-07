class PandaSocialNetwork
  def initialize
    @network = []
    @friends = {}
  end

  def add_panda(panda)

  end

  def has_panda(panda)
    @network.include? panda
  end

  def make_friends(panda1, panda2)

    raise "PandasAlreadyFriends" if are_friends(panda1, panda2)

    add_panda(panda1) unless has_panda(panda1)
    add_panda(panda2) unless has_panda(panda2)

    @friends[panda1].push(panda2) unless are_friends(panda1, panda2)
    @friends[panda2].push(panda1) unless are_friends(panda1, panda2)

  end

  def are_friends(panda1, panda2)

  end

  def friends_of(panda)

  end

  def connection_level(panda1, panda2)

  end

  def are_connected(panda1, panda2)

  end

  def how_many_gender_in_network(level, panda, gender)

  end
end
