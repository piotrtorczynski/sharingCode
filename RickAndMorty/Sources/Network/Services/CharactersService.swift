import RxSwift

protocol CharactersService {

    /// Obtains charaters
    ///
    /// - Returns: Observable with array of series charaters
    func getCharacters() -> Observable<[SeriesCharacter]>
}
