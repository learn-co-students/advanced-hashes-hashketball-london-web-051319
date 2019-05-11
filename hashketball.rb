require "pry"

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
        :name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        :name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :name => "Bismack Biyombo", 
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :name => "DeSagna Diop", 
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(player_name)
  points_scored = nil
  game_hash.each do |team, team_details|
    player_hash = team_details[:players]
    player_hash.each do |player_attributes|
      if player_attributes[:name] == player_name
        points_scored = player_attributes[:points]
      end
    end
  end
  points_scored
end

def shoe_size(name)
  shoeSz = nil
  game_hash.each do |team, team_details|
    player_hash = team_details[:players]
      player_hash.each do |player_attributes|
        if player_attributes[:name] == name
          shoeSz = player_attributes[:shoe]
        end
      end
  end
  shoeSz
end

def team_colors(team_name)
  list = []
  game_hash.each do |team, team_details|
    team_details.each do |key, value|
      if value == team_name
        list << game_hash[team][:colors]
      end
    end
  end
  list.flatten
end

def team_names
  list = []
  game_hash.each do |team, team_details|
    team_details.each do |key, value|
      if key == :team_name
        list << value
      end
    end
  end
  list
end


def player_numbers(team_name)
   game_hash.values.each do |team_details|
    if team_details.has_value?(team_name)
      return team_details[:players].map { |player| player[:number]}
    end
  end
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_details|
    player_hash = team_details[:players]
    player_hash.each do |player_attributes|
      if player_attributes[:name] == player_name
        player_attributes.delete(:name)
        player_stats = player_attributes
      end
    end
  end
  player_stats
end


def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, team_details|
      player_hash = team_details[:players]
      player_hash.each do | player_attributes |
        if player_attributes[:shoe] > big_shoes_guy
          big_shoes_guy = player_attributes[:shoe]
          rebounds = player_attributes[:rebounds]
        end
      end
    end
  rebounds
end


