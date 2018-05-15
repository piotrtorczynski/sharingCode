import RxSwift

protocol CharactersViewModelProtocol {
    var characters: Observable<[SeriesCharacter]> { get }
}

class CharactersViewModel: CharactersViewModelProtocol {

    // MARK: - Properties

    private let charactersService: CharactersService
    private let disposeBag = DisposeBag()

    // MARK: - CharactersViewModelProtocol

    var characters: Observable<[SeriesCharacter]> {
        return charactersService.getCharacters()
    }

    // MARK: - Init

    init(charactersService: CharactersService) {
        self.charactersService = charactersService
    }

}
