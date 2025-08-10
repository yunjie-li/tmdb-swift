//
//  MediaSeason.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaSeason: Codable, Hashable, Sendable, Equatable, Identifiable {
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
  
  public enum CodingKeys: String, CodingKey {
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


public struct MediaEpisode: Codable, Hashable, Sendable, Equatable, Identifiable {
  public var id: Int
  public var name: String
  public var overview: String
  public var voteAverage: Double
  public var voteCount: Int
  public var airDate: String
  public var episodeNumber: Int
  public var episodeType: String
  public var runtime: Int?
  public var seasonNumber: Int
  public var showId: Int
  public var stillPath: String?
  
  public static func == (lhs: MediaEpisode, rhs: MediaEpisode) -> Bool {
    return lhs.id == rhs.id
  }
  
  public enum CodingKeys: String, CodingKey {
    case id
    case name
    case overview
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case airDate = "air_date"
    case episodeNumber = "episode_number"
    case episodeType = "episode_type"
    case runtime
    case seasonNumber = "season_number"
    case showId = "show_id"
    case stillPath = "still_path"
  }
}

