import Foundation
import TMDB
import Testing

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

struct TMDBClientSearchTests {
  @Test
  func searchMultiSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchMulti, statusCode: 200)
    }
    let searchParameters = SearchParameters(
      query: "Shawshank",
      includeAdult: false,
      language: "en",
      page: 1
    )
    await #expect(throws: Never.self) {
      try await client.searchMulti(parameters: searchParameters)
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/multi?query=Shawshank&include_adult=false&language=en&page=1
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
  func searchMultiConvenienceMethodSuccess() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchMulti, statusCode: 200)
    }
    await #expect(throws: Never.self) {
      try await client.searchMulti(
        query: "Shawshank",
        includeAdult: false,
        language: "en",
        page: 1
      )
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/multi?query=Shawshank&include_adult=false&language=en&page=1
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
  }

  @Test
  func searchMultiMinimalParameters() async throws {
    // Setup
    let urlRequestStorage = TestStorage<URLRequest>()
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      await urlRequestStorage.setValue($0)
      return Response(data: .searchMulti, statusCode: 200)
    }
    await #expect(throws: Never.self) {
      try await client.searchMulti(query: "Shawshank")
    }
    // Verify
    let urlRequest = try #require(await urlRequestStorage.value)
    let absoluteURLString = #"""
      https://api.themoviedb.org/3/search/multi?query=Shawshank
      """#
    #expect(urlRequest.url?.absoluteString == absoluteURLString)
  }

  @Test
  func searchMultiError() async throws {
    // Test
    let client = TMDBClient(accessToken: "ABC123") {
      Response(data: .tmdbError, statusCode: 404)
    }
    await #expect(throws: TMDBError.self) {
      try await client.searchMulti(query: "NonExistent")
    }
  }
}