//
//  MediaNetwork.swift
//  TMDB
//
//  Created by wwmm on 2025/8/10.
//
import Foundation

public struct MediaNetwork: Codable, Hashable, Sendable, Equatable {
  public var id: Int
  public var logoPath: String
  public var name: String
  public var originCountry: String?
  
  public static func == (lhs: MediaNetwork, rhs: MediaNetwork) -> Bool {
    return lhs.id == rhs.id
  }
  
  private enum CodingKeys: String, CodingKey {
    case id
    case logoPath = "logo_path"
    case name
    case originCountry = "origin_country"
  }
}
