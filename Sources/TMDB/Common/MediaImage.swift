//
//  MediaImage.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaImage: Codable, Hashable, Sendable {
    let aspectRatio: Double
    let height: Int
    let lang: String?
    let filePath: String
    let voteAverage: Double
    let voteCount: Int
    let width: Int
  
  private enum CodingKeys: String, CodingKey {
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
    let backdrops: [MediaImage]?
    let logos: [MediaImage]?
    let posters: [MediaImage]?
}
