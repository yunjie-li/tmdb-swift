import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func mediaDetails(
    id: Int,
    mediaType: MediaType,
    language: String? = nil,
    includeImageLanguage: String? = nil,
    includeVideoLanguage: String? = nil,
    appending: [MediaDetailsAppendingOptions] = MediaDetailsAppendingOptions.allCases
  ) async throws -> MediaDetail {
    switch mediaType {
    case .movie:
      let movieAppending = appending.map { $0.movieOption }
      return try await movieDetails(
        id: id,
        language: language,
        includeImageLanguage: includeImageLanguage,
        includeVideoLanguage: includeVideoLanguage,
        appending: movieAppending
      )
    case .tv:
      let tvShowAppending = appending.map { $0.tvShowOption }
      return try await tvShowDetails(
        id: id,
        language: language,
        includeImageLanguage: includeImageLanguage,
        includeVideoLanguage: includeVideoLanguage,
        appending: tvShowAppending
      )
    }
  }

  public func mediaDetails(
    movieID: Int,
    mediaType: MediaType,
    language: String? = nil,
    includeImageLanguage: String? = nil,
    includeVideoLanguage: String? = nil,
    appending: [MediaDetailsAppendingOptions] = MediaDetailsAppendingOptions.allCases
  ) async throws -> MediaDetail {
    return try await mediaDetails(
      id: movieID,
      mediaType: mediaType,
      language: language,
      includeImageLanguage: includeImageLanguage,
      includeVideoLanguage: includeVideoLanguage,
      appending: appending
    )
  }

  public func mediaDetails(
    tvShowID: Int,
    mediaType: MediaType,
    language: String? = nil,
    includeImageLanguage: String? = nil,
    includeVideoLanguage: String? = nil,
    appending: [MediaDetailsAppendingOptions] = MediaDetailsAppendingOptions.allCases
  ) async throws -> MediaDetail {
    return try await mediaDetails(
      id: tvShowID,
      mediaType: mediaType,
      language: language,
      includeImageLanguage: includeImageLanguage,
      includeVideoLanguage: includeVideoLanguage,
      appending: appending
    )
  }

  public func mediaList(
    _ list: MediaList,
    language: String? = nil
  ) async throws -> Page<MediaDetail> {
    var queryItems: [URLQueryItem] = []
    if let language = language {
      queryItems.append(URLQueryItem(name: "language", value: language))
    }

    let urlRequest = try urlRequest(
      relativePath: list.relativePath,
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
    let response = try await performRequest(urlRequest)

    if response.statusCode == 200 {
      switch list.mediaType {
      case .movie:
        let moviePage = try decoder.decode(Page<Movie>.self, from: response.data)
        let mediaDetails = moviePage.results.map { MediaDetail(from: $0) }
        return Page<MediaDetail>(
          page: moviePage.page,
          results: mediaDetails,
          totalPages: moviePage.totalPages,
          totalResults: moviePage.totalResults
        )
      case .tv:
        let tvShowPage = try decoder.decode(Page<TVShow>.self, from: response.data)
        let mediaDetails = tvShowPage.results.map { MediaDetail(from: $0) }
        return Page<MediaDetail>(
          page: tvShowPage.page,
          results: mediaDetails,
          totalPages: tvShowPage.totalPages,
          totalResults: tvShowPage.totalResults
        )
      }
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }

  public func discoverMovies(
    parameters: DiscoverParameters = DiscoverParameters()
  ) async throws -> Page<MediaDetail> {
    let queryItems = parameters.toQueryItems()

    let urlRequest = try urlRequest(
      relativePath: "discover/movie",
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
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

  public func discoverTVShows(
    parameters: DiscoverParameters = DiscoverParameters()
  ) async throws -> Page<MediaDetail> {
    let queryItems = parameters.toQueryItems()

    let urlRequest = try urlRequest(
      relativePath: "discover/tv",
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
    let response = try await performRequest(urlRequest)

    if response.statusCode == 200 {
      let tvShowPage = try decoder.decode(Page<TVShow>.self, from: response.data)
      let mediaDetails = tvShowPage.results.map { MediaDetail(from: $0) }
      return Page<MediaDetail>(
        page: tvShowPage.page,
        results: mediaDetails,
        totalPages: tvShowPage.totalPages,
        totalResults: tvShowPage.totalResults
      )
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }
}
