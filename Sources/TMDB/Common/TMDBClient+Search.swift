import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func searchMulti(
    parameters: SearchParameters
  ) async throws -> Page<MediaDetail> {
    let queryItems = parameters.toQueryItems()
    
    let urlRequest = try urlRequest(
      relativePath: "search/multi",
      queryItems: queryItems
    )
    let response = try await performRequest(urlRequest)
    
    if response.statusCode == 200 {
      let mediaPage = try decoder.decode(Page<Media>.self, from: response.data)
      let mediaDetails = mediaPage.results.map { MediaDetail(from: $0) }
      return Page<MediaDetail>(
        page: mediaPage.page,
        results: mediaDetails,
        totalPages: mediaPage.totalPages,
        totalResults: mediaPage.totalResults
      )
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }
  
  public func searchMulti(
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
    return try await searchMulti(parameters: parameters)
  }
}