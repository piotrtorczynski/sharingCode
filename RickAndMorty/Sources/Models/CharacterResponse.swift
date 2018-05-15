import Foundation

struct CharacterResponse: Codable {
    let characters: [SeriesCharacter]

    private enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}
