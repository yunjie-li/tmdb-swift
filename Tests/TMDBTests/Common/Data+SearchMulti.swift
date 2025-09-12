import Foundation

extension Data {
  static let searchMulti = Data(content.utf8)
}

private let content = #"""
  {
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
        "genre_ids": [
          18,
          80,
          53
        ],
        "id": 278,
        "media_type": "movie",
        "original_language": "en",
        "original_title": "The Shawshank Redemption",
        "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an old con named Red -- for his integrity and unquenchable sense of hope.",
        "popularity": 67.931,
        "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
        "release_date": "1994-09-23",
        "title": "The Shawshank Redemption",
        "video": false,
        "vote_average": 8.7,
        "vote_count": 18040
      },
      {
        "adult": false,
        "backdrop_path": null,
        "first_air_date": "1989-12-17",
        "genre_ids": [
          16,
          35
        ],
        "id": 456,
        "media_type": "tv",
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
        "gender": 2,
        "id": 31,
        "known_for": [
          {
            "adult": false,
            "backdrop_path": "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
            "genre_ids": [
              18,
              80,
              53
            ],
            "id": 278,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "The Shawshank Redemption",
            "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an old con named Red -- for his integrity and unquenchable sense of hope.",
            "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            "release_date": "1994-09-23",
            "title": "The Shawshank Redemption",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 18040
          }
        ],
        "known_for_department": "Acting",
        "media_type": "person",
        "name": "Tim Robbins",
        "popularity": 8.229,
        "profile_path": "/hsCu1JUzQQ4pl7uFxAVCDlW4CUP.jpg"
      }
    ],
    "total_pages": 1,
    "total_results": 3
  }
  """#