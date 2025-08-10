public enum MovieList: Codable, Hashable, Sendable {
  /// Movies that are currently in theatres.
  case nowPlaying
  /// Movies ordered by popularity.
  case popular
  /// Movies ordered by rating.
  case topRated
  /// Movies that are being released soon.
  case upcoming
  /// Similar movies based on genres and keywords.
  case similar(Movie.ID)
  /// Trending movies on TMDB.
  case trending(TrendingTimeWindow)

  var relativePath: String {
    switch self {
    case .nowPlaying:
      "movie/now_playing"
    case .popular:
      "movie/popular"
    case .topRated:
      "movie/top_rated"
    case .upcoming:
      "movie/upcoming"
    case .similar(let id):
      "movie/\(id)/similar"
    case .trending(let timeWindow):
      "trending/movie/\(timeWindow.rawValue)"
    }
  }
}
