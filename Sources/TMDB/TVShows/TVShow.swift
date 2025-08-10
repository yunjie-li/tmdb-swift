public struct TVShow: Codable, Hashable, Identifiable, Sendable {
  public var adult: Bool
  public var backdropPath: BackdropPath?
  public var genreIds: [Int]
  public var id: Int
  public var originCountry: [String]
  public var originalLanguage: String
  public var originalName: String
  public var overview: String
  public var popularity: Double
  public var posterPath: PosterPath?
  public var firstAirDate: String
  public var name: String
  public var voteAverage: Double
  public var voteCount: Int

  public init(
    adult: Bool,
    backdropPath: BackdropPath?,
    genreIds: [Int],
    id: Int,
    originCountry: [String],
    originalLanguage: String,
    originalName: String,
    overview: String,
    popularity: Double,
    posterPath: PosterPath?,
    firstAirDate: String,
    name: String,
    voteAverage: Double,
    voteCount: Int
  ) {
    self.adult = adult
    self.backdropPath = backdropPath
    self.genreIds = genreIds
    self.id = id
    self.originCountry = originCountry
    self.originalLanguage = originalLanguage
    self.originalName = originalName
    self.overview = overview
    self.popularity = popularity
    self.posterPath = posterPath
    self.firstAirDate = firstAirDate
    self.name = name
    self.voteAverage = voteAverage
    self.voteCount = voteCount
  }

  private enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIds = "genre_ids"
    case id
    case originCountry = "origin_country"
    case originalLanguage = "original_language"
    case originalName = "original_name"
    case overview
    case popularity
    case posterPath = "poster_path"
    case firstAirDate = "first_air_date"
    case name
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}
