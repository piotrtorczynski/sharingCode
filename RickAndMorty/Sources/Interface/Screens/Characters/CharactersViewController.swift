import UIKit
import RxSwift
import RxCocoa

final class CharactersViewController: ViewController {

    // MARK: - Properties

    private let disposeBag = DisposeBag()
    private let viewModel: CharactersViewModelProtocol
    private let customView: CharactersView

    // MARK: - Init

    init(viewModel: CharactersViewModelProtocol, flowLayoutProvider: FlowLayoutProvidable) {
        self.viewModel = viewModel
        self.customView = CharactersView(flowLayoutProvider: flowLayoutProvider)
        super.init()
    }

    // MARK: - Setup

    override func loadView() {
        view = customView
    }

    override func setupProperties() {
        super.setupProperties()
        title = "Rick and Morty characters"
        customView.collectionView.registerClass(CharacterCell.self)
    }

    override func setupBindings() {
        super.setupBindings()

        viewModel.characters.asDriver(onErrorJustReturn: [])
            .drive(customView.collectionView.rx.items(cellIdentifier: CharacterCell.reuseIdentifier, cellType: CharacterCell.self), curriedArgument: { _, element, cell in
                cell.nameLabel.text = element.name
                cell.imageView.setImage(with: element.image)
            })
            .disposed(by: disposeBag)
    }

}
