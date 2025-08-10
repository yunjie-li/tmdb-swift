public struct Genre: Codable, Hashable, Identifiable, Sendable {
  public var id: Int
  public var name: String

  public init(
    id: ID,
    name: String
  ) {
    self.id = id
    self.name = name
  }

}
