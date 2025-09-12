import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func searchMovie(
    parameters: SearchParameters
  ) async throws -> Page<MediaDetail> {
    let queryItems = parameters.toQueryItems()
    
    let urlRequest = try urlRequest(
      relativePath: "search/movie",
      queryItems: queryItems
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
  
  public func searchMovie(
    query: String,
    includeAdult: Bool? = nil,
    language: String? = nil,
    page: Int? = nil
  ) async throws -> Page<MediaDetail> {
    let parameters = SearchParameters(
      query: query,
      includeAdult: includeAdult,
      language: language,
      page: page
    )
    return try await searchMovie(parameters: parameters)
  }
  
  public func searchTVShow(
    parameters: SearchParameters
  ) async throws -> Page<MediaDetail> {
    let queryItems = parameters.toQueryItems()
    
    let urlRequest = try urlRequest(
      relativePath: "search/tv",
      queryItems: queryItems
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
  
  public func searchTVShow(
    query: String,
    includeAdult: Bool? = nil,
    language: String? = nil,
    page: Int? = nil
  ) async throws -> Page<MediaDetail> {
    let parameters = SearchParameters(
      query: query,
      includeAdult: includeAdult,
      language: language,
      page: page
    )
    return try await searchTVShow(parameters: parameters)
  }
}