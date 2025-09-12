import Foundation
import TMDB
import Testing

struct SearchTests {
  @Test
  func searchParametersToQueryItems() {
    let parameters = SearchParameters(
      query: "Shawshank Redemption",
      includeAdult: true,
      language: "zh",
      page: 2
    )
    
    let queryItems = parameters.toQueryItems()
    
    #expect(queryItems.count == 4)
    #expect(queryItems.contains(URLQueryItem(name: "query", value: "Shawshank Redemption")))
    #expect(queryItems.contains(URLQueryItem(name: "include_adult", value: "true")))
    #expect(queryItems.contains(URLQueryItem(name: "language", value: "zh")))
    #expect(queryItems.contains(URLQueryItem(name: "page", value: "2")))
  }

  @Test
  func searchParametersMinimalToQueryItems() {
    let parameters = SearchParameters(query: "Test")
    
    let queryItems = parameters.toQueryItems()
    
    #expect(queryItems.count == 1)
    #expect(queryItems.contains(URLQueryItem(name: "query", value: "Test")))
  }

  @Test
  func searchMultiResponseDecoding() throws {
    let decoder = JSONDecoder()
    let searchResult = try decoder.decode(Page<Media>.self, from: .searchMulti)
    
    #expect(searchResult.page == 1)
    #expect(searchResult.totalPages == 1)
    #expect(searchResult.totalResults == 3)
    #expect(searchResult.results.count == 3)
    
    // Check movie result
    let movieResult = searchResult.results[0]
    #expect(movieResult.id == 278)
    #expect(movieResult.mediaType == .movie)
    #expect(movieResult.title == "The Shawshank Redemption")
    #expect(movieResult.overview.contains("Framed in the 1940s"))
    #expect(movieResult.name == nil)
    
    // Check TV show result
    let tvResult = searchResult.results[1]
    #expect(tvResult.id == 456)
    #expect(tvResult.mediaType == .tv)
    #expect(tvResult.title == "The Simpsons")
    #expect(tvResult.originCountry == ["US"])
    #expect(tvResult.name == "The Simpsons")
    
    // Check person result
    let personResult = searchResult.results[2]
    #expect(personResult.id == 31)
    #expect(personResult.mediaType == .person)
    #expect(personResult.name == "Tim Robbins")
    #expect(personResult.knownForDepartment == "Acting")
    #expect(personResult.profilePath == "/hsCu1JUzQQ4pl7uFxAVCDlW4CUP.jpg")
    #expect(personResult.knownFor?.count == 1)
  }
}