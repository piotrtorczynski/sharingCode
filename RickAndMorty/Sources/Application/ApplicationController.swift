import UIKit

final class ApplicationController {

    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
    }

    private let dependencies: ApplicationDependenciesProvider

    private(set) lazy var rootViewController: UIViewController = {
        let rootViewController = CharactersViewController(viewModel: CharactersViewModel(charactersService: dependencies.charactersService), flowLayoutProvider: FlowLayoutProvider())
        return UINavigationController(rootViewController: rootViewController)
    }()
}
