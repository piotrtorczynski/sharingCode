/// Scheme for the service
enum Scheme: String {
    case http = "http"
    case https = "https"
}

/// Interface for the API services
protocol APIURLBuilder {
    
    /// Connection scheme, default `http`
    var scheme: Scheme { get }
    
    /// Base url as string
    var host: String { get }

    /// Root to the Rest API
    var root: String { get }
}

extension APIURLBuilder {
    
    /// Default scheme `https`
    var scheme: Scheme { return .https }
}
