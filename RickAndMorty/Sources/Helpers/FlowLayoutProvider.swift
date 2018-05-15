import UIKit

protocol FlowLayoutProvidable {
    var defaultLayout: UICollectionViewFlowLayout { get }
}

class FlowLayoutProvider: FlowLayoutProvidable {
    lazy var defaultLayout: UICollectionViewFlowLayout = {
        CharactersViewFlowLayout()
    }()
}
