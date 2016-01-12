class PandaDatabase
  class << self
    def load(classname, filename)
      classname.new(filename).load
    end

    def save(classname, data, filename)
      classname.new(filename).save(data)
    end
  end
end

class JSONDatabase
  def initialize(filename)
    require 'json'
    @filename = filename
  end

  def load
    json = File.read(@filename)
    data = JSON.parse(json)

    social_network = PandaSocialNetwork.new

    data['friends'].each do |panda, friends|
      begin
        search_panda = social_network.find_panda(panda)
      rescue
        search_panda = Panda::to_o(panda)
      end

      friends.each do |friend|
        begin
          friend_panda = social_network.find_panda(friend)
        rescue
          friend_panda = Panda::to_o(friend)
        end

        begin
          social_network.make_friends(search_panda, friend_panda)
        rescue

        end
      end
    end

    social_network
  end

  def save(data)
    json = JSON.generate({ :network => data[:network], :friends => data[:friends] })
    File.open(@filename, 'w') { |file| file.write(json) }
  end
end

class YAMLDatabase
  def initialize(filename)
    require 'yaml'
    @filename = filename
  end

  def load
    yaml = File.read(@filename)
    data = YAML.load(yaml)

    social_network = PandaSocialNetwork.new

    data[:friends].each do |panda, friends|
      begin
        search_panda = social_network.find_panda(panda)
      rescue
        search_panda = panda
      end

      friends.each do |friend|
        begin
          friend_panda = social_network.find_panda(friend)
        rescue
          friend_panda = friend
        end

        begin
          social_network.make_friends(search_panda, friend_panda)
        rescue

        end
      end
    end

    social_network
  end

  def save(data)
    yaml = YAML.dump({ :network => data[:network], :friends => data[:friends] })
    File.open(@filename, 'w') { |file| file.write(yaml) }
  end
end
