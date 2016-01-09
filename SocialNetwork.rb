require 'set'
require 'json'
require_relative 'panda'

class PandaSocialNetwork
  def initialize
    @network = []
    @friends = {}
  end

  def add_panda(panda)
    raise 'PandaAlreadyThere' if @network.include? panda
    @network.push(panda)
    @friends[panda] = []
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
    @friends[panda1].include? panda2 and @friends[panda2].include? panda1
  end

  def friends_of(panda)
    return false unless @network.include? panda
    @friends[panda]
  end

  def connection_level(panda1, panda2)
    return 1 if are_friends(panda1, panda2)

    level, moved_through, friends_to_check = 0, [], [panda1]

    until(moved_through.to_set == @network.to_set)
      new_friends = []
      friends_to_check.each do |friend|
        unless moved_through.include? friend
          if are_friends(friend, panda2)
            return level+1
          else
            moved_through.push(friend)
            new_friends.concat @friends[friend]
          end
        end
      end
      friends_to_check.clear.concat new_friends.uniq
      level += 1
    end

    -1
  end

  def are_connected(panda1, panda2)
    !(connection_level(panda1, panda2) == -1)
  end

  def how_many_gender_in_network(level, panda, gender)
    counter, pandas_to_check, people_counter = 0, [panda], 0

    until counter == level
      temp_pandas = []
      pandas_to_check.each do |current_panda|
        @friends[current_panda].each do |friend|
          temp_pandas.push(friend)
          if friend.gender == gender
            people_counter += 1
          end
        end
      end
      pandas_to_check.clear.concat temp_pandas.uniq
      counter += 1
    end

    people_counter
  end

  def save(filename)
    data = JSON.generate({ :network => @network, :friends => @friends })
    File.open(filename, 'w') { |file| file.write(data) }
  end
end
