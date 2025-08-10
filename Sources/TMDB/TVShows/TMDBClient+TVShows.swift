import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func tvShowDetails(
    id: TVShow.ID,
    language: String? = nil,
    includeImageLanguage: String? = nil,
    includeVideoLanguage: String? = nil,
    appending: [TVShowDetailsAppendingOptions] = TVShowDetailsAppendingOptions.allCases
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
      relativePath: "tv/\(id)",
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
    let response = try await performRequest(urlRequest)
    if response.statusCode == 200 {
      let tvShowDetails = try decoder.decode(TVShowDetails.self, from: response.data)
      return MediaDetail(from: tvShowDetails)
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }

  public func tvShows(list: TVShowList) async throws -> Page<MediaDetail> {
    let urlRequest = try urlRequest(relativePath: list.relativePath)
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
