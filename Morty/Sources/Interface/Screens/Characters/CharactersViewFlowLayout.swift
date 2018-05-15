import UIKit

final class CharactersViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {

        if let collectionView = collectionView, collectionView.bounds.width > 0 {
            let calculatedItemWidth = round(collectionView.bounds.width) - 2 * 48
            let calculatedItemHeight = calculatedItemWidth * 1.25
            itemSize = CGSize(width: calculatedItemWidth, height: calculatedItemHeight)
            minimumLineSpacing = 24
            minimumInteritemSpacing = 8
            sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }
}
