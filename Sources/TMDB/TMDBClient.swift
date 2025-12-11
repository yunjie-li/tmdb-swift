import Foundation
import CryptoKit

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

private let defaultPerformRequest: TMDBClient.PerformRequest = { request in
  try await Response(URLSession.shared.data(for: request))
}

public final class TMDBClient: Sendable {
  public let accessToken: String
  public let performRequest: PerformRequest

  let decoder = JSONDecoder()

  public init(
    accessToken: String,
    performRequest: PerformRequest? = nil
  ) {
    self.accessToken = accessToken
    self.performRequest = performRequest ?? defaultPerformRequest
  }

  func urlRequest(
    relativePath: String,
    queryItems: [URLQueryItem]? = nil
  ) throws -> URLRequest {
    let baseURLString = "https://vtmdb.wwmm.date/3/"
    var components = URLComponents(string: baseURLString)!
    components.path.append(relativePath)
    components.queryItems = queryItems
    guard let url = components.url else {
      throw TMDBClientError.invalidURL(components)
    }
    var urlRequest = URLRequest(url: url)
    let sign = generateSignature(appName: "Vidora")
    urlRequest.allHTTPHeaderFields = [
      "Accept": "application/json",
      "Authorization": "Bearer \(accessToken)",
      "X-CLIENT-SIGN": sign.signature,
      "X-CLIENT": "Vidora",
      "X-CLIENT-TIMESTAMP": sign.timestamp
    ]
    return urlRequest
  }
  
  func generateSignature(appName: String) -> (timestamp: String, signature: String) {
      let timestamp = String(Int(Date().timeIntervalSince1970))
      let raw = appName + timestamp + appName
      let hash = SHA256.hash(data: raw.data(using: .utf8)!)
      let signature = hash.compactMap { String(format: "%02x", $0) }.joined()
      let short = String(signature.prefix(24))
      return (timestamp, short)
  }

  public typealias PerformRequest = @Sendable (URLRequest) async throws -> Response
}
