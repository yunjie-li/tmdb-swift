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
  func searchMovieResponseDecoding() throws {
    let decoder = JSONDecoder()
    let moviePage = try decoder.decode(Page<Movie>.self, from: .searchMovie)
    let searchResult = Page<MediaDetail>(
      page: moviePage.page,
      results: moviePage.results.map { MediaDetail(from: $0) },
      totalPages: moviePage.totalPages,
      totalResults: moviePage.totalResults
    )
    
    #expect(searchResult.page == 1)
    #expect(searchResult.totalPages == 1)
    #expect(searchResult.totalResults == 2)
    #expect(searchResult.results.count == 2)
    
    // Check first movie result
    let firstMovie = searchResult.results[0]
    #expect(firstMovie.id == 278)
    #expect(firstMovie.mediaType == .movie)
    #expect(firstMovie.title == "The Shawshank Redemption")
    #expect(firstMovie.overview.contains("Framed in the 1940s"))
    
    // Check second movie result
    let secondMovie = searchResult.results[1]
    #expect(secondMovie.id == 238)
    #expect(secondMovie.mediaType == .movie)
    #expect(secondMovie.title == "The Godfather")
    #expect(secondMovie.overview.contains("Spanning the years"))
  }

  @Test
  func searchTVShowResponseDecoding() throws {
    let decoder = JSONDecoder()
    let tvPage = try decoder.decode(Page<TVShow>.self, from: .searchTVShow)
    let searchResult = Page<MediaDetail>(
      page: tvPage.page,
      results: tvPage.results.map { MediaDetail(from: $0) },
      totalPages: tvPage.totalPages,
      totalResults: tvPage.totalResults
    )
    
    #expect(searchResult.page == 1)
    #expect(searchResult.totalPages == 1)
    #expect(searchResult.totalResults == 2)
    #expect(searchResult.results.count == 2)
    
    // Check first TV show result
    let firstShow = searchResult.results[0]
    #expect(firstShow.id == 456)
    #expect(firstShow.mediaType == .tv)
    #expect(firstShow.title == "The Simpsons")
    #expect(firstShow.originCountry == ["US"])
    
    // Check second TV show result
    let secondShow = searchResult.results[1]
    #expect(secondShow.id == 1396)
    #expect(secondShow.mediaType == .tv)
    #expect(secondShow.title == "Breaking Bad")
    #expect(secondShow.overview.contains("When Walter White"))
  }
}