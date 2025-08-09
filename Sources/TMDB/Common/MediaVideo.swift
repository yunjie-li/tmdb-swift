//
//  MediaVideo.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//

import Foundation

public struct MediaVideo: Codable, Hashable, Sendable, Equatable {
  let lang: String?
  let name: String
  let key: String
  let site: String
  let size: Double?
  let type: String
  let official: Bool?
  let publishedAt: String?
  let id: String
  
  public static func == (lhs: MediaVideo, rhs: MediaVideo) -> Bool {
    return lhs.id == rhs.id
  }
  
  private enum CodingKeys: String, CodingKey {
    case lang = "iso_639_1"
    case name
    case key
    case site
    case size
    case type
    case official
    case publishedAt = "published_at"
    case id
  }
}

public struct MediaVideos: Codable, Hashable, Sendable {
  let results: [MediaVideo]?
}
