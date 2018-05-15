/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var apiClient: APIClient { get }
    var charactersService: CharactersService { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = {
       DefaultAPIClient()
    }()

    private(set) lazy var charactersService: CharactersService = {
        APICharatersService(apiClient: apiClient)
    }()
}
