public struct Media: Codable, Hashable, Identifiable, Sendable {
  public enum MediaType: String, Codable, Sendable {
    case movie
    case tvShow = "tv"
  }
  
  public enum MediaID: Codable, Hashable, Sendable {
    case movie(Movie.ID)
    case tvShow(TVShow.ID)
    
    public var rawValue: Int {
      switch self {
      case .movie(let id):
        return id.rawValue
      case .tvShow(let id):
        return id.rawValue
      }
    }
  }
  
  public var id: MediaID
  public var mediaType: MediaType
  public var adult: Bool
  public var backdropPath: BackdropPath?
  public var genreIDs: [Genre.ID]?
  public var originalLanguage: String
  public var originalTitle: String
  public var title: String
  public var overview: String
  public var popularity: Double?
  public var posterPath: PosterPath?
  public var releaseDate: String?
  public var voteAverage: Double?
  public var voteCount: Int?
  public var video: Bool?
  public var originCountry: [String]?
  
  public init(
    id: MediaID,
    mediaType: MediaType,
    adult: Bool,
    backdropPath: BackdropPath?,
    genreIDs: [Genre.ID]?,
    originalLanguage: String,
    originalTitle: String,
    title: String,
    overview: String,
    popularity: Double?,
    posterPath: PosterPath?,
    releaseDate: String?,
    voteAverage: Double?,
    voteCount: Int?,
    video: Bool?,
    originCountry: [String]?
  ) {
    self.id = id
    self.mediaType = mediaType
    self.adult = adult
    self.backdropPath = backdropPath
    self.genreIDs = genreIDs
    self.originalLanguage = originalLanguage
    self.originalTitle = originalTitle
    self.title = title
    self.overview = overview
    self.popularity = popularity
    self.posterPath = posterPath
    self.releaseDate = releaseDate
    self.voteAverage = voteAverage
    self.voteCount = voteCount
    self.video = video
    self.originCountry = originCountry
  }
  
  public init(from movie: Movie) {
    self.init(
      id: .movie(movie.id),
      mediaType: .movie,
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIDs: movie.genreIDs,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      title: movie.title,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
      video: movie.video,
      originCountry: nil
    )
  }
  
  public init(from tvShow: TVShow) {
    self.init(
      id: .tvShow(tvShow.id),
      mediaType: .tvShow,
      adult: tvShow.adult,
      backdropPath: tvShow.backdropPath,
      genreIDs: tvShow.genreIDs,
      originalLanguage: tvShow.originalLanguage,
      originalTitle: tvShow.originalName,
      title: tvShow.name,
      overview: tvShow.overview,
      popularity: tvShow.popularity,
      posterPath: tvShow.posterPath,
      releaseDate: tvShow.firstAirDate,
      voteAverage: tvShow.voteAverage,
      voteCount: tvShow.voteCount,
      video: nil,
      originCountry: tvShow.originCountry
    )
  }
}

extension Media.MediaID: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = .movie(Movie.ID(rawValue: value))
  }
}

public struct MediaDetail: Codable, Hashable, Identifiable, Sendable {
  public var id: Media.MediaID
  public var mediaType: Media.MediaType
  public var adult: Bool
  public var backdropPath: BackdropPath?
  public var genreIDs: [Genre.ID]?
  public var genres: [Genre]?
  public var originalLanguage: String
  public var originalTitle: String
  public var title: String
  public var overview: String
  public var popularity: Double
  public var posterPath: PosterPath?
  public var releaseDate: String?
  public var voteAverage: Double
  public var voteCount: Int
  public var video: Bool?
  public var originCountry: [String]?
  
  public var belongsToCollection: MovieCollection?
  public var budget: Int?
  public var homepage: String?
  public var imdbID: String?
  public var productionCompanies: [ProductionCompany]?
  public var productionCountries: [Country]?
  public var revenue: Int?
  public var runtime: Int?
  public var spokenLanguages: [Language]?
  public var status: String?
  public var tagline: String?
  
  public var inProduction: Bool?
  public var languages: [String]?
  public var lastAirDate: String?
  public var numberOfEpisodes: Int?
  public var numberOfSeasons: Int?
  public var type: String?
  public var seasons: [MediaSeason]?
  
  public var images: MediaImages?
  public var credits: MediaCredits?
  public var videos: MediaVideos?
  public var similarMovies: Page<Movie>?
  public var recommendationsMovies: Page<Movie>?
  public var similarTVShows: Page<TVShow>?
  public var recommendationsTVShows: Page<TVShow>?
  
  public init(
    id: Media.MediaID,
    mediaType: Media.MediaType,
    adult: Bool,
    backdropPath: BackdropPath?,
    genreIDs: [Genre.ID]?,
    genres: [Genre]?,
    originalLanguage: String,
    originalTitle: String,
    title: String,
    overview: String,
    popularity: Double,
    posterPath: PosterPath?,
    releaseDate: String?,
    voteAverage: Double,
    voteCount: Int,
    video: Bool?,
    originCountry: [String]?,
    belongsToCollection: MovieCollection?,
    budget: Int?,
    homepage: String?,
    imdbID: String?,
    productionCompanies: [ProductionCompany]?,
    productionCountries: [Country]?,
    revenue: Int?,
    runtime: Int?,
    spokenLanguages: [Language]?,
    status: String?,
    tagline: String?,
    inProduction: Bool?,
    languages: [String]?,
    lastAirDate: String?,
    numberOfEpisodes: Int?,
    numberOfSeasons: Int?,
    type: String?,
    seasons: [MediaSeason]?,
    images: MediaImages?,
    credits: MediaCredits?,
    videos: MediaVideos?,
    similarMovies: Page<Movie>?,
    recommendationsMovies: Page<Movie>?,
    similarTVShows: Page<TVShow>?,
    recommendationsTVShows: Page<TVShow>?
  ) {
    self.id = id
    self.mediaType = mediaType
    self.adult = adult
    self.backdropPath = backdropPath
    self.genreIDs = genreIDs
    self.genres = genres
    self.originalLanguage = originalLanguage
    self.originalTitle = originalTitle
    self.title = title
    self.overview = overview
    self.popularity = popularity
    self.posterPath = posterPath
    self.releaseDate = releaseDate
    self.voteAverage = voteAverage
    self.voteCount = voteCount
    self.video = video
    self.originCountry = originCountry
    self.belongsToCollection = belongsToCollection
    self.budget = budget
    self.homepage = homepage
    self.imdbID = imdbID
    self.productionCompanies = productionCompanies
    self.productionCountries = productionCountries
    self.revenue = revenue
    self.runtime = runtime
    self.spokenLanguages = spokenLanguages
    self.status = status
    self.tagline = tagline
    self.inProduction = inProduction
    self.languages = languages
    self.lastAirDate = lastAirDate
    self.numberOfEpisodes = numberOfEpisodes
    self.numberOfSeasons = numberOfSeasons
    self.type = type
    self.seasons = seasons
    self.images = images
    self.credits = credits
    self.videos = videos
    self.similarMovies = similarMovies
    self.recommendationsMovies = recommendationsMovies
    self.similarTVShows = similarTVShows
    self.recommendationsTVShows = recommendationsTVShows
  }
  
  public init(from movieDetails: MovieDetails) {
    self.init(
      id: .movie(movieDetails.id),
      mediaType: .movie,
      adult: movieDetails.adult,
      backdropPath: movieDetails.backdropPath,
      genreIDs: nil,
      genres: movieDetails.genres,
      originalLanguage: movieDetails.originalLanguage,
      originalTitle: movieDetails.originalTitle,
      title: movieDetails.title,
      overview: movieDetails.overview,
      popularity: movieDetails.popularity,
      posterPath: movieDetails.posterPath,
      releaseDate: movieDetails.releaseDate,
      voteAverage: movieDetails.voteAverage,
      voteCount: movieDetails.voteCount,
      video: movieDetails.video,
      originCountry: movieDetails.originCountry,
      belongsToCollection: movieDetails.belongsToCollection,
      budget: movieDetails.budget,
      homepage: movieDetails.homepage,
      imdbID: movieDetails.imdbID,
      productionCompanies: movieDetails.productionCompanies,
      productionCountries: movieDetails.productionCountries,
      revenue: movieDetails.revenue,
      runtime: movieDetails.runtime,
      spokenLanguages: movieDetails.spokenLanguages,
      status: movieDetails.status,
      tagline: movieDetails.tagline,
      inProduction: nil,
      languages: nil,
      lastAirDate: nil,
      numberOfEpisodes: nil,
      numberOfSeasons: nil,
      type: nil,
      seasons: nil,
      images: movieDetails.images,
      credits: movieDetails.credits,
      videos: movieDetails.videos,
      similarMovies: movieDetails.similar,
      recommendationsMovies: movieDetails.recommendations,
      similarTVShows: nil,
      recommendationsTVShows: nil
    )
  }
  
  public init(from tvShowDetails: TVShowDetails) {
    self.init(
      id: .tvShow(tvShowDetails.id),
      mediaType: .tvShow,
      adult: tvShowDetails.adult,
      backdropPath: tvShowDetails.backdropPath,
      genreIDs: nil,
      genres: tvShowDetails.genres,
      originalLanguage: tvShowDetails.originalLanguage,
      originalTitle: tvShowDetails.originalName,
      title: tvShowDetails.name,
      overview: tvShowDetails.overview,
      popularity: tvShowDetails.popularity,
      posterPath: tvShowDetails.posterPath,
      releaseDate: tvShowDetails.firstAirDate,
      voteAverage: tvShowDetails.voteAverage,
      voteCount: tvShowDetails.voteCount,
      video: nil,
      originCountry: tvShowDetails.originCountry,
      belongsToCollection: nil,
      budget: nil,
      homepage: tvShowDetails.homepage,
      imdbID: nil,
      productionCompanies: tvShowDetails.productionCompanies,
      productionCountries: tvShowDetails.productionCountries,
      revenue: nil,
      runtime: nil,
      spokenLanguages: tvShowDetails.spokenLanguages,
      status: tvShowDetails.status,
      tagline: tvShowDetails.tagline,
      inProduction: tvShowDetails.inProduction,
      languages: tvShowDetails.languages,
      lastAirDate: tvShowDetails.lastAirDate,
      numberOfEpisodes: tvShowDetails.numberOfEpisodes,
      numberOfSeasons: tvShowDetails.numberOfSeasons,
      type: tvShowDetails.type,
      seasons: tvShowDetails.seasons,
      images: tvShowDetails.images,
      credits: tvShowDetails.credits,
      videos: tvShowDetails.videos,
      similarMovies: nil,
      recommendationsMovies: nil,
      similarTVShows: tvShowDetails.similar,
      recommendationsTVShows: tvShowDetails.recommendations
    )
  }
  
  public init(from movie: Movie) {
    self.init(
      id: .movie(movie.id),
      mediaType: .movie,
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIDs: movie.genreIDs,
      genres: nil,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      title: movie.title,
      overview: movie.overview,
      popularity: movie.popularity ?? 0.0,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      voteAverage: movie.voteAverage ?? 0.0,
      voteCount: movie.voteCount ?? 0,
      video: movie.video,
      originCountry: nil,
      belongsToCollection: nil,
      budget: nil,
      homepage: nil,
      imdbID: nil,
      productionCompanies: nil,
      productionCountries: nil,
      revenue: nil,
      runtime: nil,
      spokenLanguages: nil,
      status: nil,
      tagline: nil,
      inProduction: nil,
      languages: nil,
      lastAirDate: nil,
      numberOfEpisodes: nil,
      numberOfSeasons: nil,
      type: nil,
      seasons: nil,
      images: nil,
      credits: nil,
      videos: nil,
      similarMovies: nil,
      recommendationsMovies: nil,
      similarTVShows: nil,
      recommendationsTVShows: nil
    )
  }
  
  public init(from tvShow: TVShow) {
    self.init(
      id: .tvShow(tvShow.id),
      mediaType: .tvShow,
      adult: tvShow.adult,
      backdropPath: tvShow.backdropPath,
      genreIDs: tvShow.genreIDs,
      genres: nil,
      originalLanguage: tvShow.originalLanguage,
      originalTitle: tvShow.originalName,
      title: tvShow.name,
      overview: tvShow.overview,
      popularity: tvShow.popularity,
      posterPath: tvShow.posterPath,
      releaseDate: tvShow.firstAirDate,
      voteAverage: tvShow.voteAverage,
      voteCount: tvShow.voteCount,
      video: nil,
      originCountry: tvShow.originCountry,
      belongsToCollection: nil,
      budget: nil,
      homepage: nil,
      imdbID: nil,
      productionCompanies: nil,
      productionCountries: nil,
      revenue: nil,
      runtime: nil,
      spokenLanguages: nil,
      status: nil,
      tagline: nil,
      inProduction: nil,
      languages: nil,
      lastAirDate: nil,
      numberOfEpisodes: nil,
      numberOfSeasons: nil,
      type: nil,
      seasons: nil,
      images: nil,
      credits: nil,
      videos: nil,
      similarMovies: nil,
      recommendationsMovies: nil,
      similarTVShows: nil,
      recommendationsTVShows: nil
    )
  }
}