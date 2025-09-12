import Foundation

extension Data {
  static let searchTVShow = Data(content.utf8)
}

private let content = #"""
  {
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/gKG5QGz5R0FE8fqKOkFMROsHQaC.jpg",
        "first_air_date": "1989-12-17",
        "genre_ids": [
          16,
          35
        ],
        "id": 456,
        "name": "The Simpsons",
        "origin_country": ["US"],
        "original_language": "en",
        "original_name": "The Simpsons",
        "overview": "Set in Springfield, the average American town, the show focuses on the antics and everyday adventures of the Simpson family; Homer, Marge, Bart, Lisa and Maggie, as well as a virtual cast of thousands.",
        "popularity": 369.346,
        "poster_path": "/KoFnfWJdRPzd0aWdoQDoKSRpJzTf.jpg",
        "vote_average": 8.014,
        "vote_count": 7538
      },
      {
        "adult": false,
        "backdrop_path": "/4XddcRDtnNjYmLRMYpbrhFxsbuq.jpg",
        "first_air_date": "2008-01-20",
        "genre_ids": [
          18,
          80
        ],
        "id": 1396,
        "name": "Breaking Bad",
        "origin_country": ["US"],
        "original_language": "en",
        "original_name": "Breaking Bad",
        "overview": "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live, he becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
        "popularity": 313.075,
        "poster_path": "/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
        "vote_average": 8.9,
        "vote_count": 11538
      }
    ],
    "total_pages": 1,
    "total_results": 2
  }
  """#