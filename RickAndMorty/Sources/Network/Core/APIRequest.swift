/// Defines request's method
enum Method: String {
    case GET, POST, PUT, DELETE
}

protocol APIRequest {
    
    /// HTTP method
    var method: Method { get }
    
    /// Path to resource
    var path: String { get }
    
    /// HTTP method
    var urlBuilder: APIURLBuilder { get }
}

// MARK: - Default values for API request
extension APIRequest {
    
    var method: Method { return .GET }
    
    var urlBuilder: APIURLBuilder { return RickAndMortyURLBuilder() }
}
