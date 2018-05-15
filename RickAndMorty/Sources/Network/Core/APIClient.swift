import RxSwift

protocol APIClient {
    
    /// Performs specific request
    ///
    /// - Parameters:
    ///   - request: APIRequest which needs to be performed
    func perform(request: APIRequest) -> Single<APIResponse>
}
