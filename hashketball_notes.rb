require "pry"
# Write your code here!

def game_hash()
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player) # player name (string)
  game_hash.each do |team, keys| # game_hash above, team (:home/:away - symbols) keys - 2nd tier symbols.
    game_hash[team].each do |keys, data| # data is the information such as Charlotte Hornets
      if game_hash[team][:players].include?(player)
        return game_hash[team][:players][player][:points]
      end
      # binding.pry
    end
  end
end

def shoe_size(player) 
  game_hash.each do |team, keys| 
    game_hash[team].each do |keys, data| 
      if game_hash[team][:players].include?(player)
        return game_hash[team][:players][player][:shoe]
      end
    end
  end
end

def player_stats(player) 
  game_hash.each do |team, keys| 
    game_hash[team].each do |keys, data| 
      if game_hash[team][:players].include?(player)
        return game_hash[team][:players][player]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |team, keys|
    game_hash[team].each do |keys, data| 
      if data == name
        return game_hash[team][:colors]
      end
    end
  end
end


def team_names()
  team_name_array = []
  game_hash.each do |team, keys|
  #   game_hash[team].collect do |keys, data|
    team_name_array << game_hash[team][:team_name]
    # binding.pry
    end
    team_name_array
end

def player_numbers(team)
  charlotte_numbers = []
  brooklyn_numbers = []
  game_hash.each do |team, keys| 
    if game_hash[team][:team_name] == "Brooklyn Nets"
      game_hash[:home][:players].each do |data, info_tag|
          brooklyn_numbers << game_hash[:home][:players][data][:number]
      end
      brooklyn_numbers
    elsif game_hash[team][:team_name] == "Charlotte Hornets"
      game_hash[:away][:players].each do |data, info_tag|
        charlotte_numbers << game_hash[:away][:players][data][:number]
      end
      charlotte_numbers
    end
    # binding.pry
  end
  if team == "Brooklyn Nets"
    return brooklyn_numbers
  elsif team == "Charlotte Hornets"
    return charlotte_numbers
  end

end

def big_shoe_rebounds()
  # new_hash = {}
  n = nil
  game_hash.each do |team, keys|
    game_hash[team].each do |keys, data|
      game_hash[team][:players].each do |data, info_tag|
        game_hash[team][:players][data].each do |info_tag, info|
          if n == nil || game_hash[team][:players][data].fetch(:shoe) > n 
            n = game_hash[team][:players][data][:shoe]
          end
        end
      end
    end
  end
  game_hash.each do |team, keys|
    game_hash[team].each do |keys, data|
      game_hash[team][:players].each do |data, info_tag|
        game_hash[team][:players][data].each do |info_tag, info|
          if n == game_hash[team][:players][data][:shoe]
          # new_hash = {team => {:players => {data => {:rebounds => info}}}} 
              # this didn't work BECAUSE we had defined everything up to data, but when we changed to :rebounds, it just selects the first value from the iterative list (with respect to the tier) which would be the value for the :number key.
            return game_hash[team][:players][data].fetch(:rebounds)
          end
        end
      end
    end
  end
end
