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
    let mediaPage = try decoder.decode(Page<Media>.self, from: .searchMulti)
    let searchResult = Page<MediaDetail>(
      page: mediaPage.page,
      results: mediaPage.results.map { MediaDetail(from: $0) },
      totalPages: mediaPage.totalPages,
      totalResults: mediaPage.totalResults
    )
    
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
    
    // Check TV show result
    let tvResult = searchResult.results[1]
    #expect(tvResult.id == 456)
    #expect(tvResult.mediaType == .tv)
    #expect(tvResult.title == "The Simpsons")
    #expect(tvResult.originCountry == ["US"])
    
    // Check person result
    let personResult = searchResult.results[2]
    #expect(personResult.id == 31)
    #expect(personResult.mediaType == .person)
    #expect(personResult.originalTitle == "Tim Robbins")
    #expect(personResult.title == "Tim Robbins")
  }
}