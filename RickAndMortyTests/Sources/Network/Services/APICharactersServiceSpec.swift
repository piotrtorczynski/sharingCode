import Quick
import Nimble
import RxTest

@testable import RickAndMorty

class APICharactersServiceSpec: QuickSpec {
    override func spec() {
        describe("APICharactersService") {
            var sut: APICharatersService!
            var apiClientSpy: APIClientSpy!
            var scheduler: TestScheduler!
            var observer: TestableObserver<[SeriesCharacter]>!

            beforeEach {
                apiClientSpy = APIClientSpy()
                scheduler = TestScheduler(initialClock: 0)
                observer = scheduler.createObserver([SeriesCharacter].self)

                sut = APICharatersService(apiClient: apiClientSpy)
            }

            context("when getting characters") {
                beforeEach {
                    _ = sut.getCharacters().subscribe(observer)
                }

                it("should trigger characters request") {
                    expect(apiClientSpy.performedRequest).to(beAKindOf(CharactersRequest.self))
                }
            }

            context("when response does not contain data") {
                beforeEach {
                    apiClientSpy.responseData = nil

                    _ = sut.getCharacters().subscribe(observer)
                }

                it("should emit just completed event") {
                    expect(observer.events.count).to(equal(1))
                }
            }

            context("when response is valid and has both rick and morty") {
                beforeEach {
                    apiClientSpy.responseData = SeriesCharacter.testRickAndMorty

                    _ = sut.getCharacters().subscribe(observer)
                }

                it("should return 2 characters") {
                    expect(observer.events.first!.value.element!.count).to(equal(2))
                }

                it("should return rick") {
                    expect(observer.events.first!.value.element!.first!.name).to(equal("Rick"))
                }

                it("should return morty") {
                    expect(observer.events.first!.value.element!.last!.name).to(equal("Morty"))
                }
            }
        }
    }
}
