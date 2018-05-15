import Foundation
import RxSwift

@testable import Morty

class APIClientSpy: APIClient {
    var performedRequest: APIRequest?
    var responseData: Data?

    func perform(request: APIRequest) -> Single<APIResponse> {
        performedRequest = request

        return Single.just(APIResponse(
            data: responseData,
            response: HTTPURLResponse(
                url: URL(string: "fixed_url")!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil)!
            )
        )
    }
}
