import Foundation

extension URLComponents {
    
    /// Convenience initializer for APIRequest
    ///
    /// - Parameter request: Request which needs to be executed
    init(request: APIRequest) {
        self = {
            var components = URLComponents()
            
            components.scheme = request.urlBuilder.scheme.rawValue
            components.host = request.urlBuilder.host
            components.path = "/" + NSString.path(withComponents: [
                request.urlBuilder.root,
                request.path
            ])
            
            return components
        }()
    }
    
}
