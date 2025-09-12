import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func searchMulti(
    parameters: SearchParameters
  ) async throws -> Page<Media> {
    let queryItems = parameters.toQueryItems()
    
    let urlRequest = try urlRequest(
      relativePath: "search/multi",
      queryItems: queryItems
    )
    let response = try await performRequest(urlRequest)
    
    if response.statusCode == 200 {
      return try decoder.decode(Page<Media>.self, from: response.data)
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }
  
  public func searchMulti(
    query: String,
    includeAdult: Bool? = nil,
    language: String? = nil,
    page: Int? = nil
  ) async throws -> Page<Media> {
    let parameters = SearchParameters(
      query: query,
      includeAdult: includeAdult,
      language: language,
      page: page
    )
    return try await searchMulti(parameters: parameters)
  }
}