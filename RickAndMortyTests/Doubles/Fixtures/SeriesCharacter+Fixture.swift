import Foundation

@testable import RickAndMorty

extension SeriesCharacter {
    static var testRickAndMorty: Data {
        return """
            {
                "results": [
                    {
                        "id": 1,
                        "name": "Rick",
                        "image": "http://fixed_image_one.com"
                    },
                    {
                        "id": 2,
                        "name": "Morty",
                        "image": "http://fixed_image_two.com"
                    }
                ]
            }
        """.data(using: .utf8)!
    }
}
