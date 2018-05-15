import Quick
import Nimble
import RxTest

@testable import Rick

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

                it("should return only one character") {
                    expect(observer.events.first!.value.element!.count).to(equal(1))
                }

                it("should return morty") {
                    expect(observer.events.first!.value.element!.first!.name).to(equal("Morty"))
                }
            }
        }
    }
}
