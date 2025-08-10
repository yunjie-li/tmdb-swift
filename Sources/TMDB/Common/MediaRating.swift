//
//  MediaRating.swift
//  TMDB
//
//  Created by wwmm on 2025/8/10.
//
import Foundation

public struct MediaRating: Codable, Hashable, Sendable {
  public var imdb: Double?
  public var metacritic: Double?
  public var tomatoes: Double?
  public var popcorn: Double?
  public var trakt: Double?
  public var tmdb: Double?
  public var letterboxd: Double?
  
  public enum CodingKeys: String, CodingKey {
    case imdb
    case metacritic
    case tomatoes
    case popcorn
    case trakt
    case tmdb
    case letterboxd
  }
}
