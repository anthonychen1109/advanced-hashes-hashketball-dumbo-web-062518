# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black, White"],
      players: {
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

    away: {
      team_name: "Charolette Hornets",
      colors: ["Turquoise, Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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

def home_team_name
  game_hash[:home][:team_name]
  puts home_team_name
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == name
        points = stat[:points]
      end
    end
  end
  points
end

def shoe_size(name)
  shoe = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == name
        shoe = stat[:shoe]
      end
    end
  end
  shoe
end

def team_colors(name)
  colors = ""
  game_hash.each do |location, data|
    if data[:team_name] == name
      colors = data[:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location, data|
    teams.push(data[:team_name])
  end
  teams
end

def player_numbers(team_name)
  arr = []
  game_hash.each do |location, data|
    data[:players].each do |info, stat|
      arr.push(stat[:number])
    end
  end
  arr
end

def player_stats(player_name)
  player_stat = {}
  game_hash.each do |location, data|
    data[:players].each do |info, stat|
      if info == player_name
        player_stat = stat
      end
    end
  end
  player_stat
end

def big_shoe_rebounds
  biggest_shoe = 0
  most_rebounds = 0
  game_hash.each do |location, data|
    data[:players].each do |info, stat|
      if stat[:shoe] > biggest_shoe
        most_rebounds = stat[:rebounds]
      end
    end
  end
  most_rebounds
end

def most_points_scored
highest_points = 0
player_name = ""
  game_hash.each do |location, data|
    data[:players].each do |info, stat|
      if stat[:points] > highest_points
        highest_points = stat[:points]
        player_name = info
      end
    end
  end
  player_name
end

def winning_team
  home_score = 0
  away_score = 0
  new_hash = {}
  game_hash.each do |location, data|
    if location == :home
      data[:players].each do |name, stats|
        home_score += stats[:points]
        new_hash[:home] = home_score
      end
    end
  end
  game_hash.each do |location, data|
    if location == :away
      data[:players].each do |name, stats|
        away_score += stats[:points]
        new_hash[:away] = away_score
      end
    end
  end
  winner = new_hash.each {|key, value| puts key if value == new_hash.values.max}
  winner
end

def player_with_longest_name
  longest_name = ""
  count = 0
  game_hash.each do |location, data|
    data[:players].each do |info, stats|
      if info.length > count
        longest_name = info
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton
  steals = 0
  player_name = ""
  game_hash.each do |location, data|
    data[:players].each do |info, stat|
      if stat[:steals] > steals
        steals = stat[:steals]
        player_name = info
      end
    end
  end
  player_name == player_with_longest_name
end