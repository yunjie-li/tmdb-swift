//
//  MediaSeason.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaSeason: Codable, Hashable, Sendable, Equatable {
  public var airDate: String?
  public var episodeCount: Int
  public var id: Int
  public var name: String
  public var overview: String
  public var posterPath: String?
  public var seasonNumber: Int
  public var voteAverage: Double
  
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


