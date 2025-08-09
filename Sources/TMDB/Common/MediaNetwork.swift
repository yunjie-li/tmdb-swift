//
//  MediaNetwork.swift
//  TMDB
//
//  Created by wwmm on 2025/8/10.
//
import Foundation

public struct MediaNetwork: Codable, Hashable, Sendable, Equatable {
  let id: Int
  let logoPath: String
  let name: String
  let originCountry: String?
  
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
