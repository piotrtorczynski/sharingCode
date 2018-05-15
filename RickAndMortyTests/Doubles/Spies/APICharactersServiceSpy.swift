import RxSwift

@testable import RickAndMorty

final class APICharactersServiceSpy: CharactersService {
    var methodInvoked = false

    func getCharacters() -> Observable<[SeriesCharacter]> {
        methodInvoked = true

        return Observable.just([])
    }
}
