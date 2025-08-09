//
//  MediaCredits.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaCredit: Codable, Hashable, Sendable {
  let id: Int
  let name: String
  let originalName: String?
  let character: String?
  let profilePath: String?
  let adult: Bool?
  let gender: Int?
  let knownForDepartment: String?
  let popularity: Double?
  let creditId: String?
  let order: Int?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case originalName = "original_name"
    case character
    case profilePath = "profile_path"
    case adult
    case gender
    case knownForDepartment = "known_for_department"
    case popularity
    case creditId = "credit_id"
    case order
  }
}

public struct MediaCredits: Codable, Hashable, Sendable {
    let cast: [MediaCredit]?
}
