def game_hash
{
  :home => {:team_name => "Brooklyn Nets",
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
                :slam_dunks => 1,
              },
              "Reggie Evans" => {
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7,
              },
              "Brook Lopez" => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15,
              },
              "Mason Plumlee" => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5,
              },
              "Jason Terry" => {
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1,
              },
      
            }},
  :away => {:team_name => "Charlotte Hornets",
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
                :slam_dunks => 2,
              },
              "Bismack Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 7,
                :blocks => 15,
                :slam_dunks => 10,
              },
              "DeSagna Diop" => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5,
              },
              "Ben Gordon" => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0,
              },
              "Brendan Haywood" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 22,
                :blocks => 5,
                :slam_dunks => 12,
              },
      
            }},
}
end

def num_points_scored(name)
game_hash[:home][:players].keys.each do |named|
if name == named
return game_hash[:home][:players][name][:points]
end 
game_hash[:away][:players].keys.each do |named|
if name == named
return game_hash[:away][:players][name][:points]
end
end
# game_hash[:away][:players].keys
end
end

def shoe_size(name)
game_hash[:home][:players].keys.each do |named|
if name == named
return game_hash[:home][:players][name][:shoe]
end 
game_hash[:away][:players].keys.each do |named|
if name == named
return game_hash[:away][:players][name][:shoe]
end
end
# game_hash[:away][:players].keys
end
end

def team_colors(name)
game_hash[:home][:team_name] == name ? game_hash[:home][:colors] : game_hash[:away][:colors]
end
name = "Brooklyn Jets"

def team_names
teams = []
teams << game_hash[:home][:team_name] 
teams << game_hash[:away][:team_name]
teams
end

def player_numbers(team)
home_players = game_hash[:home][:players].keys 
away_players = game_hash[:away][:players].keys

final_h = home_players.collect do |player|
game_hash[:home][:players][player][:number]
end

final_a = away_players.collect do |player|
game_hash[:away][:players][player][:number]
end

team == game_hash[:home][:team_name] ? final_h : final_a

end

def player_stats(name)

game_hash[:home][:players][name] == name ? game_hash[:home][:players][name] : game_hash[:away][:players][name]

end


def player_stats(name)

game_hash[:home][:players].keys.collect do |named|
if name == named
# return "home player #{name}"
return game_hash[:home][:players][name]
end
end
# return "away player #{name}"
return game_hash[:away][:players][name]
end


def big_shoe_rebounds
# get array of all players
home_players = game_hash[:home][:players].keys 
away_players = game_hash[:away][:players].keys

# all_players = home_players + away_players
home_shoes = []
home_players.each do |player|
home_shoes << game_hash[:home][:players][player][:shoe]
end

away_shoes = []
away_players.each do |player|
away_shoes << game_hash[:away][:players][player][:shoe]
end

all_shoes = home_shoes + away_shoes
biggest_size = all_shoes.max

home_players.each do |player|
if game_hash[:home][:players][player][:shoe] == biggest_size
return game_hash[:home][:players][player][:rebounds]
end
# elseif
# away_players.each do |player|
# game_hash[:away][:players][player][:shoe] ? player : "can't find it."
end
end




