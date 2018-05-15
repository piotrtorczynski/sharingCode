import Quick
import Nimble
import RxTest

@testable import RickAndMorty

class CharactersViewModelSpec: QuickSpec {
    override func spec() {
        describe("CharactersViewModel") {
            var sut: CharactersViewModel!
            var charactersServiceSpy: APICharactersServiceSpy!
            var scheduler: TestScheduler!
            var observer: TestableObserver<[SeriesCharacter]>!

            beforeEach {
                charactersServiceSpy = APICharactersServiceSpy()
                scheduler = TestScheduler(initialClock: 0)
                observer = scheduler.createObserver([SeriesCharacter].self)

                sut = CharactersViewModel(charactersService: charactersServiceSpy)
            }

            context("when binding to characters") {
                beforeEach {
                    _ = sut.characters.subscribe(observer)
                }

                it("should invoke get characters method") {
                    expect(charactersServiceSpy.methodInvoked).to(beTrue())
                }
            }
        }
    }
}
