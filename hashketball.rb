require "pry"

# Write your code here!
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": { 
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3, 
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12, 
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3, 
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3, 
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4, 
          blocks: 11,
          slam_dunks: 1,
        },
      },
    }, 

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        },
      }
    }

  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name.to_s == player_name
            # binding.pry
            return stats[:points]  
          end      
        end
      end
    end
  end 
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name.to_s == player_name
            # binding.pry
            return stats[:shoe]  
          end      
        end
      end
    end
  end 
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  array_of_team_names = []
  game_hash.each do |location, team_data|
    array_of_team_names << team_data[:team_name]        
  end
  array_of_team_names
  # binding.pry
end

def player_numbers(team_name)
  jersey_number_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name].to_s == team_name
      team_data[:players].each do |key, player|
        jersey_number_array << player[:number] 
      end
    end
  end
  jersey_number_array
end

def player_stats(player_name)
  stats = nil
  game_hash.each do |team_key, team_values|
      team_values[:players].each do |player_key, player_value|
        # binding.pry
        if player_key.to_s == player_name
          stats = player_value
        end
      end
  end
  stats
end

def big_shoe_rebounds
  current_biggest_shoe = 0
  current_rebound_score = nil
  game_hash.each do |team_key, team_values|
    team_values[:players].each do |player_key, player_value|
      if player_value[:shoe] > current_biggest_shoe
        current_biggest_shoe = player_value[:shoe]
        current_rebound_score = player_value[:rebounds]
      end
    end
  end
  current_rebound_score
end






