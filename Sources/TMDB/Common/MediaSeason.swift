//
//  MediaSeason.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaSeason: Codable, Hashable, Sendable, Equatable {
  let airDate: String?
  let episodeCount: Int
  let id: Int
  let name: String
  let overview: String
  let posterPath: String?
  let seasonNumber: Int
  let voteAverage: Double
  
  public static func == (lhs: MediaSeason, rhs: MediaSeason) -> Bool {
    return lhs.id == rhs.id
  }
  
  private enum CodingKeys: String, CodingKey {
    case airDate = "air_date"
    case episodeCount = "episode_count"
    case id
    case name
    case overview
    case posterPath = "poster_path"
    case seasonNumber = "season_number"
    case voteAverage = "vote_average"
  }
}


