//
//  MediaImage.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaImage: Codable, Hashable, Sendable {
  public var aspectRatio: Double
  public var height: Int
  public var lang: String?
  public var filePath: String
  public var voteAverage: Double
  public var voteCount: Int
  public var width: Int

  public enum CodingKeys: String, CodingKey {
    case aspectRatio = "aspect_ratio"
    case height
    case lang = "iso_639_1"
    case filePath = "file_path"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case width
  }
}

public struct MediaImages: Codable, Hashable, Sendable {
  public var backdrops: [MediaImage]?
  public var logos: [MediaImage]?
  public var posters: [MediaImage]?
}
