import Foundation

public struct PersonCombinedCredit: Codable, Hashable, Sendable {
  public var id: Int
  public var cast: [PersonCredit]
  public var crew: [PersonCredit]

  public init(id: Int, cast: [PersonCredit], crew: [PersonCredit]) {
    self.id = id
    self.cast = cast
    self.crew = crew
  }
}

public struct PersonCredit: Codable, Hashable, Identifiable, Sendable {
  public var id: Int
  public var mediaType: MediaType
  public var adult: Bool
  public var backdropPath: BackdropPath?
  public var genreIds: [Int]?
  public var originalLanguage: String
  public var overview: String
  public var popularity: Double?
  public var posterPath: PosterPath?
  public var voteAverage: Double?
  public var voteCount: Int?

  // Movie fields
  public var originalTitle: String?
  public var title: String?
  public var releaseDate: String?
  public var video: Bool?

  // TV fields
  public var originalName: String?
  public var name: String?
  public var firstAirDate: String?
  public var originCountry: [String]?
  public var episodeCount: Int?

  // Credit fields
  public var creditId: String
  public var character: String?
  public var order: Int?

  public init(
    id: Int,
    mediaType: MediaType,
    adult: Bool,
    backdropPath: BackdropPath?,
    genreIds: [Int]?,
    originalLanguage: String,
    overview: String,
    popularity: Double?,
    posterPath: PosterPath?,
    voteAverage: Double?,
    voteCount: Int?,
    originalTitle: String?,
    title: String?,
    releaseDate: String?,
    video: Bool?,
    originalName: String?,
    name: String?,
    firstAirDate: String?,
    originCountry: [String]?,
    episodeCount: Int?,
    creditId: String,
    character: String?,
    order: Int?
  ) {
    self.id = id
    self.mediaType = mediaType
    self.adult = adult
    self.backdropPath = backdropPath
    self.genreIds = genreIds
    self.originalLanguage = originalLanguage
    self.overview = overview
    self.popularity = popularity
    self.posterPath = posterPath
    self.voteAverage = voteAverage
    self.voteCount = voteCount
    self.originalTitle = originalTitle
    self.title = title
    self.releaseDate = releaseDate
    self.video = video
    self.originalName = originalName
    self.name = name
    self.firstAirDate = firstAirDate
    self.originCountry = originCountry
    self.episodeCount = episodeCount
    self.creditId = creditId
    self.character = character
    self.order = order
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case mediaType = "media_type"
    case adult
    case backdropPath = "backdrop_path"
    case genreIds = "genre_ids"
    case originalLanguage = "original_language"
    case overview
    case popularity
    case posterPath = "poster_path"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case originalTitle = "original_title"
    case title
    case releaseDate = "release_date"
    case video
    case originalName = "original_name"
    case name
    case firstAirDate = "first_air_date"
    case originCountry = "origin_country"
    case episodeCount = "episode_count"
    case creditId = "credit_id"
    case character
    case order
  }
}

extension PersonCredit {
  public var displayTitle: String {
    switch mediaType {
    case .movie:
      return title ?? originalTitle ?? ""
    case .tv:
      return name ?? originalName ?? ""
    case .person:
      return name ?? ""
    }
  }

  public var originalDisplayTitle: String {
    switch mediaType {
    case .movie:
      return originalTitle ?? title ?? ""
    case .tv:
      return originalName ?? name ?? ""
    case .person:
      return name ?? ""
    }
  }

  public var date: String? {
    switch mediaType {
    case .movie:
      return releaseDate
    case .tv:
      return firstAirDate
    case .person:
      return nil
    }
  }
}
