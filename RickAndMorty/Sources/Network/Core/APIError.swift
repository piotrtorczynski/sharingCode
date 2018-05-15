/// Error which may occur during creating request
///
/// - incorrectURL: Indicates incorrect URL - might be because of incorrect URL, host or path
/// - unexpectedStatusCode: Response status code was out of accepted range
/// - noResponse: Response was missing or not HTTP response
/// - rateExceeded: To many requests
/// - internetConnectionUnavailable: Internet connection went out
enum APIError: Error {
    case incorrectURL(url: String)
    case unexpectedStatusCode(statusCode: Int)
    case noResponse
    case rateExceeded
    case internetConnectionUnavailable
}
