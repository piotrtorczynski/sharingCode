import UIKit

final class CharactersView: View {

    // MARK: - Properties

    private let flowLayoutProvider: FlowLayoutProvidable

    // MARK: - Init

    init(flowLayoutProvider: FlowLayoutProvidable) {
        self.flowLayoutProvider = flowLayoutProvider
        super.init()
    }

    // MARK: - Subviews

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayoutProvider.defaultLayout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.backgroundView = UIImageView(image: UIImage(named: "backgroundImage"))

        return collectionView
    }()

    // MARK: - Setup

    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        addSubview(collectionView)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setupProperties() {
        super.setupProperties()
        backgroundColor = .red
    }
}
