require_relative "panda"

class PandaSocialNetwork
  def initialize
    @network = []
    @friends = {}
  end

  def add_panda(panda)
    raise 'PandaAlreadyThere' if @network.include? panda
    @network.push(panda)
  end

  def has_panda(panda)

  end

  def make_friends(panda1, panda2)

  end

  def are_friends(panda1, panda2)
    @friends[panda1].include? panda2 and @friends[panda2].include? panda1
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
