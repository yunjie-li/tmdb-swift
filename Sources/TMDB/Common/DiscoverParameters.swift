import Foundation

public struct DiscoverParameters: Sendable {
  public var language: String?
  public var region: String?
  public var sortBy: SortBy?
  public var page: Int?
  public var includeAdult: Bool?
  public var includeVideo: Bool?
  public var primaryReleaseYear: Int?
  public var primaryReleaseDateGTE: String?
  public var primaryReleaseDateLTE: String?
  public var releaseDateGTE: String?
  public var releaseDateLTE: String?
  public var withReleaseType: [ReleaseType]?
  public var year: Int?
  public var voteCountGTE: Int?
  public var voteCountLTE: Int?
  public var voteAverageGTE: Double?
  public var voteAverageLTE: Double?
  public var withCast: String?
  public var withCrew: String?
  public var withPeople: String?
  public var withCompanies: String?
  public var withGenres: String?
  public var withoutGenres: String?
  public var withKeywords: String?
  public var withoutKeywords: String?
  public var withRuntimeGTE: Int?
  public var withRuntimeLTE: Int?
  public var withOriginalLanguage: String?
  public var withWatchProviders: String?
  public var watchRegion: String?
  public var withWatchMonetizationTypes: [MonetizationType]?
  public var withoutCompanies: String?
  public var firstAirDateGTE: String?
  public var firstAirDateLTE: String?
  public var firstAirDateYear: Int?
  public var timezone: String?
  public var airDateGTE: String?
  public var airDateLTE: String?
  public var withNetworks: String?
  public var includeNullFirstAirDates: Bool?
  public var withStatus: [TVStatus]?
  public var withType: [TVType]?
  public var screendActually: String?

  public init(
    language: String? = nil,
    region: String? = nil,
    sortBy: SortBy? = nil,
    page: Int? = nil,
    includeAdult: Bool? = nil,
    includeVideo: Bool? = nil,
    primaryReleaseYear: Int? = nil,
    primaryReleaseDateGTE: String? = nil,
    primaryReleaseDateLTE: String? = nil,
    releaseDateGTE: String? = nil,
    releaseDateLTE: String? = nil,
    withReleaseType: [ReleaseType]? = nil,
    year: Int? = nil,
    voteCountGTE: Int? = nil,
    voteCountLTE: Int? = nil,
    voteAverageGTE: Double? = nil,
    voteAverageLTE: Double? = nil,
    withCast: String? = nil,
    withCrew: String? = nil,
    withPeople: String? = nil,
    withCompanies: String? = nil,
    withGenres: String? = nil,
    withoutGenres: String? = nil,
    withKeywords: String? = nil,
    withoutKeywords: String? = nil,
    withRuntimeGTE: Int? = nil,
    withRuntimeLTE: Int? = nil,
    withOriginalLanguage: String? = nil,
    withWatchProviders: String? = nil,
    watchRegion: String? = nil,
    withWatchMonetizationTypes: [MonetizationType]? = nil,
    withoutCompanies: String? = nil,
    firstAirDateGTE: String? = nil,
    firstAirDateLTE: String? = nil,
    firstAirDateYear: Int? = nil,
    timezone: String? = nil,
    airDateGTE: String? = nil,
    airDateLTE: String? = nil,
    withNetworks: String? = nil,
    includeNullFirstAirDates: Bool? = nil,
    withStatus: [TVStatus]? = nil,
    withType: [TVType]? = nil,
    screendActually: String? = nil
  ) {
    self.language = language
    self.region = region
    self.sortBy = sortBy
    self.page = page
    self.includeAdult = includeAdult
    self.includeVideo = includeVideo
    self.primaryReleaseYear = primaryReleaseYear
    self.primaryReleaseDateGTE = primaryReleaseDateGTE
    self.primaryReleaseDateLTE = primaryReleaseDateLTE
    self.releaseDateGTE = releaseDateGTE
    self.releaseDateLTE = releaseDateLTE
    self.withReleaseType = withReleaseType
    self.year = year
    self.voteCountGTE = voteCountGTE
    self.voteCountLTE = voteCountLTE
    self.voteAverageGTE = voteAverageGTE
    self.voteAverageLTE = voteAverageLTE
    self.withCast = withCast
    self.withCrew = withCrew
    self.withPeople = withPeople
    self.withCompanies = withCompanies
    self.withGenres = withGenres
    self.withoutGenres = withoutGenres
    self.withKeywords = withKeywords
    self.withoutKeywords = withoutKeywords
    self.withRuntimeGTE = withRuntimeGTE
    self.withRuntimeLTE = withRuntimeLTE
    self.withOriginalLanguage = withOriginalLanguage
    self.withWatchProviders = withWatchProviders
    self.watchRegion = watchRegion
    self.withWatchMonetizationTypes = withWatchMonetizationTypes
    self.withoutCompanies = withoutCompanies
    self.firstAirDateGTE = firstAirDateGTE
    self.firstAirDateLTE = firstAirDateLTE
    self.firstAirDateYear = firstAirDateYear
    self.timezone = timezone
    self.airDateGTE = airDateGTE
    self.airDateLTE = airDateLTE
    self.withNetworks = withNetworks
    self.includeNullFirstAirDates = includeNullFirstAirDates
    self.withStatus = withStatus
    self.withType = withType
    self.screendActually = screendActually
  }

  public func toQueryItems() -> [URLQueryItem] {
    var items: [URLQueryItem] = []

    if let language = language {
      items.append(URLQueryItem(name: "language", value: language))
    }
    if let region = region {
      items.append(URLQueryItem(name: "region", value: region))
    }
    if let sortBy = sortBy {
      items.append(URLQueryItem(name: "sort_by", value: sortBy.rawValue))
    }
    if let page = page {
      items.append(URLQueryItem(name: "page", value: String(page)))
    }
    if let includeAdult = includeAdult {
      items.append(URLQueryItem(name: "include_adult", value: String(includeAdult)))
    }
    if let includeVideo = includeVideo {
      items.append(URLQueryItem(name: "include_video", value: String(includeVideo)))
    }
    if let primaryReleaseYear = primaryReleaseYear {
      items.append(URLQueryItem(name: "primary_release_year", value: String(primaryReleaseYear)))
    }
    if let primaryReleaseDateGTE = primaryReleaseDateGTE {
      items.append(URLQueryItem(name: "primary_release_date.gte", value: primaryReleaseDateGTE))
    }
    if let primaryReleaseDateLTE = primaryReleaseDateLTE {
      items.append(URLQueryItem(name: "primary_release_date.lte", value: primaryReleaseDateLTE))
    }
    if let releaseDateGTE = releaseDateGTE {
      items.append(URLQueryItem(name: "release_date.gte", value: releaseDateGTE))
    }
    if let releaseDateLTE = releaseDateLTE {
      items.append(URLQueryItem(name: "release_date.lte", value: releaseDateLTE))
    }
    if let withReleaseType = withReleaseType {
      let value = withReleaseType.map { String($0.rawValue) }.joined(separator: "|")
      items.append(URLQueryItem(name: "with_release_type", value: value))
    }
    if let year = year {
      items.append(URLQueryItem(name: "year", value: String(year)))
    }
    if let voteCountGTE = voteCountGTE {
      items.append(URLQueryItem(name: "vote_count.gte", value: String(voteCountGTE)))
    }
    if let voteCountLTE = voteCountLTE {
      items.append(URLQueryItem(name: "vote_count.lte", value: String(voteCountLTE)))
    }
    if let voteAverageGTE = voteAverageGTE {
      items.append(URLQueryItem(name: "vote_average.gte", value: String(voteAverageGTE)))
    }
    if let voteAverageLTE = voteAverageLTE {
      items.append(URLQueryItem(name: "vote_average.lte", value: String(voteAverageLTE)))
    }
    if let withCast = withCast {
      items.append(URLQueryItem(name: "with_cast", value: withCast))
    }
    if let withCrew = withCrew {
      items.append(URLQueryItem(name: "with_crew", value: withCrew))
    }
    if let withPeople = withPeople {
      items.append(URLQueryItem(name: "with_people", value: withPeople))
    }
    if let withCompanies = withCompanies {
      items.append(URLQueryItem(name: "with_companies", value: withCompanies))
    }
    if let withGenres = withGenres {
      items.append(URLQueryItem(name: "with_genres", value: withGenres))
    }
    if let withoutGenres = withoutGenres {
      items.append(URLQueryItem(name: "without_genres", value: withoutGenres))
    }
    if let withKeywords = withKeywords {
      items.append(URLQueryItem(name: "with_keywords", value: withKeywords))
    }
    if let withoutKeywords = withoutKeywords {
      items.append(URLQueryItem(name: "without_keywords", value: withoutKeywords))
    }
    if let withRuntimeGTE = withRuntimeGTE {
      items.append(URLQueryItem(name: "with_runtime.gte", value: String(withRuntimeGTE)))
    }
    if let withRuntimeLTE = withRuntimeLTE {
      items.append(URLQueryItem(name: "with_runtime.lte", value: String(withRuntimeLTE)))
    }
    if let withOriginalLanguage = withOriginalLanguage {
      items.append(URLQueryItem(name: "with_original_language", value: withOriginalLanguage))
    }
    if let withWatchProviders = withWatchProviders {
      items.append(URLQueryItem(name: "with_watch_providers", value: withWatchProviders))
    }
    if let watchRegion = watchRegion {
      items.append(URLQueryItem(name: "watch_region", value: watchRegion))
    }
    if let withWatchMonetizationTypes = withWatchMonetizationTypes {
      let value = withWatchMonetizationTypes.map { $0.rawValue }.joined(separator: "|")
      items.append(URLQueryItem(name: "with_watch_monetization_types", value: value))
    }
    if let withoutCompanies = withoutCompanies {
      items.append(URLQueryItem(name: "without_companies", value: withoutCompanies))
    }
    if let firstAirDateGTE = firstAirDateGTE {
      items.append(URLQueryItem(name: "first_air_date.gte", value: firstAirDateGTE))
    }
    if let firstAirDateLTE = firstAirDateLTE {
      items.append(URLQueryItem(name: "first_air_date.lte", value: firstAirDateLTE))
    }
    if let firstAirDateYear = firstAirDateYear {
      items.append(URLQueryItem(name: "first_air_date_year", value: String(firstAirDateYear)))
    }
    if let timezone = timezone {
      items.append(URLQueryItem(name: "timezone", value: timezone))
    }
    if let airDateGTE = airDateGTE {
      items.append(URLQueryItem(name: "air_date.gte", value: airDateGTE))
    }
    if let airDateLTE = airDateLTE {
      items.append(URLQueryItem(name: "air_date.lte", value: airDateLTE))
    }
    if let withNetworks = withNetworks {
      items.append(URLQueryItem(name: "with_networks", value: withNetworks))
    }
    if let includeNullFirstAirDates = includeNullFirstAirDates {
      items.append(
        URLQueryItem(name: "include_null_first_air_dates", value: String(includeNullFirstAirDates)))
    }
    if let withStatus = withStatus {
      let value = withStatus.map { String($0.rawValue) }.joined(separator: "|")
      items.append(URLQueryItem(name: "with_status", value: value))
    }
    if let withType = withType {
      let value = withType.map { String($0.rawValue) }.joined(separator: "|")
      items.append(URLQueryItem(name: "with_type", value: value))
    }
    if let screendActually = screendActually {
      items.append(URLQueryItem(name: "screened_theatrically", value: screendActually))
    }

    return items
  }
}

public enum SortBy: String, CaseIterable, Sendable {
  case popularityAsc = "popularity.asc"
  case popularityDesc = "popularity.desc"
  case releaseDateAsc = "release_date.asc"
  case releaseDateDesc = "release_date.desc"
  case revenueAsc = "revenue.asc"
  case revenueDesc = "revenue.desc"
  case primaryReleaseDateAsc = "primary_release_date.asc"
  case primaryReleaseDateDesc = "primary_release_date.desc"
  case originalTitleAsc = "original_title.asc"
  case originalTitleDesc = "original_title.desc"
  case voteAverageAsc = "vote_average.asc"
  case voteAverageDesc = "vote_average.desc"
  case voteCountAsc = "vote_count.asc"
  case voteCountDesc = "vote_count.desc"
  case firstAirDateAsc = "first_air_date.asc"
  case firstAirDateDesc = "first_air_date.desc"
}

public enum ReleaseType: Int, CaseIterable, Sendable {
  case premiere = 1
  case theatricalLimited = 2
  case theatrical = 3
  case digital = 4
  case physical = 5
  case tv = 6
}

public enum MonetizationType: String, CaseIterable, Sendable {
  case flatrate
  case free
  case ads
  case rent
  case buy
}

public enum TVStatus: Int, CaseIterable, Sendable {
  case returningStatus = 0
  case planned = 1
  case inProduction = 2
  case ended = 3
  case canceled = 4
  case pilot = 5
}

public enum TVType: Int, CaseIterable, Sendable {
  case documentary = 0
  case news = 1
  case miniseries = 2
  case reality = 3
  case scripted = 4
  case talkShow = 5
  case video = 6
}
