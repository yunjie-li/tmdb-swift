import Foundation
import TMDB
import Testing

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

struct TMDBClientSearchTests {
  @Test
  func searchMovieSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchMovie, statusCode: 200)
    }
    let searchParameters = SearchParameters(
      query: "Shawshank",
      includeAdult: false,
      language: "en",
      page: 1
    )
    await #expect(throws: Never.self) {
      try await client.searchMovie(parameters: searchParameters)
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/movie?query=Shawshank&include_adult=false&language=en&page=1
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
    #expect(urlRequest.httpMethod == "GET")
    #expect(urlRequest.httpBody == nil)
    #expect(
      urlRequest.allHTTPHeaderFields?["Authorization"] == "Bearer ABC123"
    )
    #expect(
      urlRequest.allHTTPHeaderFields?["Accept"] == "application/json"
    )
  }

  @Test
  func searchMovieConvenienceMethodSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchMovie, statusCode: 200)
    }
    await #expect(throws: Never.self) {
      try await client.searchMovie(
        query: "Godfather",
        includeAdult: false,
        language: "en",
        page: 1
      )
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/movie?query=Godfather&include_adult=false&language=en&page=1
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
  }

  @Test
  func searchTVShowSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "DEF456") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchTVShow, statusCode: 200)
    }
    let searchParameters = SearchParameters(
      query: "Breaking Bad",
      includeAdult: false,
      language: "en",
      page: 1
    )
    await #expect(throws: Never.self) {
      try await client.searchTVShow(parameters: searchParameters)
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/tv?query=Breaking%20Bad&include_adult=false&language=en&page=1
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
    #expect(urlRequest.httpMethod == "GET")
    #expect(urlRequest.httpBody == nil)
    #expect(
      urlRequest.allHTTPHeaderFields?["Authorization"] == "Bearer DEF456"
    )
    #expect(
      urlRequest.allHTTPHeaderFields?["Accept"] == "application/json"
    )
  }

  @Test
  func searchTVShowConvenienceMethodSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "GHI789") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchTVShow, statusCode: 200)
    }
    await #expect(throws: Never.self) {
      try await client.searchTVShow(
        query: "Simpsons",
        language: "zh"
      )
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/tv?query=Simpsons&language=zh
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
  }

  @Test
  func searchMovieError() async throws {
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      Response(data: .tmdbError, statusCode: 404)
    }
    await #expect(throws: TMDBError.self) {
      try await client.searchMovie(query: "NonExistentMovie")
    }
  }

  @Test
  func searchTVShowError() async throws {
    // Test
    let client = TMDBClient(accessToken: "DEF456") {
      Response(data: .tmdbError, statusCode: 404)
    }
    await #expect(throws: TMDBError.self) {
      try await client.searchTVShow(query: "NonExistentShow")
    }
  }
}