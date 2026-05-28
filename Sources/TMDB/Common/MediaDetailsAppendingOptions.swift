public enum MediaDetailsAppendingOptions: String, CaseIterable, Codable, Hashable, Sendable {
  case similar
  case images
  case credits
  case videos
  case recommendations
  case seasons
  case externalIDs = "external_ids"

  var movieOption: MovieDetailsAppendingOptions {
    switch self {
    case .similar: return .similar
    case .images: return .images
    case .credits: return .credits
    case .videos: return .videos
    case .recommendations: return .recommendations
    case .seasons: return .seasons
    case .externalIDs: return .externalIDs
    }
  }

  var tvShowOption: TVShowDetailsAppendingOptions {
    switch self {
    case .similar: return .similar
    case .images: return .images
    case .credits: return .credits
    case .videos: return .videos
    case .recommendations: return .recommendations
    case .seasons: return .seasons
    case .externalIDs: return .externalIDs
    }
  }
}
