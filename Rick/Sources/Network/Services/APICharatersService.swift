import RxSwift

final class APICharatersService: CharactersService {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Init

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - CharactersService

    func getCharacters() -> Observable<[SeriesCharacter]> {
        return apiClient.perform(request: CharactersRequest())
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(CharacterResponse.self, from: $0.data!) }
            .map { $0.characters.filter { character in !character.name.lowercased().contains("rick") } }
            .asObservable()
    }
}
