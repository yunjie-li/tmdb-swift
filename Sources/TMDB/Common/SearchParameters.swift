import Foundation

public struct SearchParameters: Sendable {
  public let query: String
  public let includeAdult: Bool?
  public let language: String?
  public let page: Int?
  
  public init(
    query: String,
    includeAdult: Bool? = nil,
    language: String? = nil,
    page: Int? = nil
  ) {
    self.query = query
    self.includeAdult = includeAdult
    self.language = language
    self.page = page
  }
  
  func toQueryItems() -> [URLQueryItem] {
    var queryItems: [URLQueryItem] = []
    
    queryItems.append(URLQueryItem(name: "query", value: query))
    
    if let includeAdult = includeAdult {
      queryItems.append(URLQueryItem(name: "include_adult", value: String(includeAdult)))
    }
    
    if let language = language {
      queryItems.append(URLQueryItem(name: "language", value: language))
    }
    
    if let page = page {
      queryItems.append(URLQueryItem(name: "page", value: String(page)))
    }
    
    return queryItems
  }
}