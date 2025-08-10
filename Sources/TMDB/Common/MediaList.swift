public enum MediaList: Codable, Hashable, Sendable {
  case movie(MovieList)
  case tvShow(TVShowList)
  
  public static let movieNowPlaying = MediaList.movie(.nowPlaying)
  public static let moviePopular = MediaList.movie(.popular)
  public static let movieTopRated = MediaList.movie(.topRated)
  public static let movieUpcoming = MediaList.movie(.upcoming)
  
  public static let tvShowAiringToday = MediaList.tvShow(.airingToday)
  public static let tvShowOnTheAir = MediaList.tvShow(.onTheAir)
  public static let tvShowPopular = MediaList.tvShow(.popular)
  public static let tvShowTopRated = MediaList.tvShow(.topRated)
  
  public static func movieSimilar(to id: Movie.ID) -> MediaList {
    return .movie(.similar(id))
  }
  
  public static func tvShowSimilar(to id: TVShow.ID) -> MediaList {
    return .tvShow(.similar(id))
  }
  
  public static func movieTrending(_ timeWindow: TrendingTimeWindow) -> MediaList {
    return .movie(.trending(timeWindow))
  }
  
  public static func tvShowTrending(_ timeWindow: TrendingTimeWindow) -> MediaList {
    return .tvShow(.trending(timeWindow))
  }
  
  var relativePath: String {
    switch self {
    case .movie(let movieList):
      return movieList.relativePath
    case .tvShow(let tvShowList):
      return tvShowList.relativePath
    }
  }
  
  var mediaType: MediaType {
    switch self {
    case .movie:
      return .movie
    case .tvShow:
      return .tvShow
    }
  }
}
