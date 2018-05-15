import UIKit

extension UICollectionView {

    func registerClass<CellType: UICollectionViewCell>(_ type: CellType.Type) where CellType: Reusable {
        register(CellType.self, forCellWithReuseIdentifier: CellType.reuseIdentifier)
    }

    func dequeue<CellType: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> CellType where CellType: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CellType.reuseIdentifier, for: indexPath) as? CellType else {
            fatalError("Could not dequeue cell of type \(CellType.self) with reuseIdentifier \(CellType.reuseIdentifier)")
        }
        return cell
    }
}
