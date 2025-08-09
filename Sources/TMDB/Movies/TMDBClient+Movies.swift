import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func movieDetails(
    id: Movie.ID,
    language: String? = nil,
    includeImageLanguage: String? = nil,
    includeVideoLanguage: String? = nil,
    appending: [MovieDetailsAppendingOptions] = MovieDetailsAppendingOptions.allCases
  ) async throws -> MediaDetail {
    var queryItems: [URLQueryItem] = []
    if let language = language {
      queryItems.append(URLQueryItem(name: "language", value: language))
    }
    if let includeImageLanguage = includeImageLanguage {
      queryItems.append(URLQueryItem(name: "include_image_language", value: includeImageLanguage))
    }
    if let includeVideoLanguage = includeVideoLanguage {
      queryItems.append(URLQueryItem(name: "include_video_language", value: includeVideoLanguage))
    }
    if !appending.isEmpty {
      let value = appending.map(\.rawValue).joined(separator: ",")
      queryItems.append(URLQueryItem(name: "append_to_response", value: value))
    }
    let urlRequest = try urlRequest(
      relativePath: "movie/\(id.rawValue)",
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
    let response = try await performRequest(urlRequest)
    if response.statusCode == 200 {
      let movieDetails = try decoder.decode(MovieDetails.self, from: response.data)
      return MediaDetail(from: movieDetails)
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }

  public func movies(list: MovieList) async throws -> Page<MediaDetail> {
    let urlRequest = try urlRequest(relativePath: list.relativePath)
    let response = try await performRequest(urlRequest)
    if response.statusCode == 200 {
      let moviePage = try decoder.decode(Page<Movie>.self, from: response.data)
      let mediaDetails = moviePage.results.map { MediaDetail(from: $0) }
      return Page<MediaDetail>(
        page: moviePage.page,
        results: mediaDetails,
        totalPages: moviePage.totalPages,
        totalResults: moviePage.totalResults
      )
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }
}
