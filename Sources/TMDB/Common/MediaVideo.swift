//
//  MediaVideo.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//

import Foundation

public struct MediaVideo: Codable, Hashable, Sendable, Equatable, Identifiable {
  public var lang: String?
  public var name: String
  public var key: String
  public var site: String
  public var size: Double?
  public var type: String
  public var official: Bool?
  public var publishedAt: String?
  public var id: String

  public static func == (lhs: MediaVideo, rhs: MediaVideo) -> Bool {
    return lhs.id == rhs.id
  }

  public enum CodingKeys: String, CodingKey {
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
  public var results: [MediaVideo]?
}
