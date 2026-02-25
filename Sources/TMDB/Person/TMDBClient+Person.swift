import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension TMDBClient {
  public func personCombinedCredits(
    personId: Int,
    language: String? = nil
  ) async throws -> PersonCombinedCredit {
    var queryItems: [URLQueryItem] = []

    if let language = language {
      queryItems.append(URLQueryItem(name: "language", value: language))
    }

    let urlRequest = try urlRequest(
      relativePath: "person/\(personId)/combined_credits",
      queryItems: queryItems.isEmpty ? nil : queryItems
    )
    let response = try await performRequest(urlRequest)

    if response.statusCode == 200 {
      return try decoder.decode(PersonCombinedCredit.self, from: response.data)
    } else {
      throw try decoder.decode(TMDBError.self, from: response.data)
    }
  }
}
