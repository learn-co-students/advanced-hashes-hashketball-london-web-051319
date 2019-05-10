# Write your code here!
def game_hash
  {
    home:
      {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players:
          {
            "Alan Anderson" =>
              {
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
              },
            "Reggie Evans" =>
              {
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
              },
            "Brook Lopez" =>
              {
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
              },
            "Mason Plumlee" =>
              {
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
              },
            "Jason Terry" =>
              {
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
              }

          }
      },
    away:
      {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players:
          {
            "Jeff Adrien" =>
              {
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
              },
            "Bismak Biyombo" =>
              {
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 7,
                blocks: 15,
                slam_dunks: 10
              },
            "DeSagna Diop" =>
              {
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
              },
            "Ben Gordon" =>
              {
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
              },
            "Brendan Haywood" =>
              {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12
              }
          }
      }
  }
end

def num_points_scored(name)
  game_hash[:home][:players][name] == nil ? game_hash[:away][:players][name][:points] : game_hash[:home][:players][name][:points]
end

def shoe_size(name)
  game_hash[:home][:players][name] == nil ? game_hash[:away][:players][name][:shoe] : game_hash[:home][:players][name][:shoe]
end

def team_colors(name)
  game_hash[:home][:team_name] == name ? game_hash[:home][:colors] : game_hash[:away][:colors]
end

def team_names
  result = []
  result << game_hash[:home][:team_name]
  result << game_hash[:away][:team_name]
  result
end

def player_numbers(team)
  players_hash = game_hash[:home][:team_name] == team ? game_hash[:home][:players] : game_hash[:away][:players]
  jersies = []
  players_hash.each {|k,v| jersies << v[:number]}
  jersies
end

def player_stats(name)
  game_hash[:home][:players][name] == nil ? game_hash[:away][:players][name] : game_hash[:home][:players][name]
end

def big_shoe_rebounds
  largest_shoe = [nil, nil, nil]
  game_hash.each do |team, team_stats|
    team_stats[:players]. each do |name, player_stats|
      if largest_shoe[1] == nil or largest_shoe[1] < player_stats[:shoe]
      largest_shoe[1] = player_stats[:shoe]
      largest_shoe[0] = name
      largest_shoe[2] = team
      end
    end
  end
  game_hash[largest_shoe[2]][:players][largest_shoe[0]][:rebounds]
end
