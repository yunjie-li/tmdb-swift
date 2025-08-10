//
//  MediaCredits.swift
//  TMDB
//
//  Created by wwmm on 2025/8/9.
//
import Foundation

public struct MediaCredit: Codable, Hashable, Sendable, Identifiable {
  public var id: Int
  public var name: String
  public var originalName: String?
  public var character: String?
  public var profilePath: String?
  public var adult: Bool?
  public var gender: Int?
  public var knownForDepartment: String?
  public var popularity: Double?
  public var creditId: String?
  public var order: Int?
  
  public enum CodingKeys: String, CodingKey {
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
    public var cast: [MediaCredit]?
}
