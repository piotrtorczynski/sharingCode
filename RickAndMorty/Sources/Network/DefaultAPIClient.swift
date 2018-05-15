import Foundation
import RxSwift

final class DefaultAPIClient: APIClient {
    // MARK: Properties
    
    private let session: URLSession
    
    // MARK: Initializers
    
    /// Initializes DefaultAPIClient
    ///
    /// - Parameter session: URLSession to use - default is `.shared`
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: APIClient

    func perform(request: APIRequest) -> Single<APIResponse> {
        return send(request: request)
    }
    
    // MARK: Private
    
    private func send(request: APIRequest) -> Single<APIResponse> {
        return Single<APIResponse>.create { [unowned self] single in
            var urlRequest: URLRequest
            do {
                urlRequest = try URLRequest(request: request)
            } catch let error {
                single(.error(error))
                return Disposables.create()
            }

            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                        single(.error(APIError.internetConnectionUnavailable))
                    } else {
                        single(.error(error))
                    }
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    single(.error(APIError.noResponse))
                    return
                }

                if 200..<300 ~= response.statusCode {
                    single(.success(APIResponse(data: data, response: response)))
                } else if response.statusCode == 429 {
                    single(.error(APIError.rateExceeded))
                } else {
                    single(.error(APIError.unexpectedStatusCode(statusCode: response.statusCode)))
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
