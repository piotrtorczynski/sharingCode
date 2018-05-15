import UIKit

final class CharacterCell: CollectionViewCell {

    // MARK: - Subviews

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true

        return imageView
    }()

    private lazy var maskingView: UIView = {
        let view = UIView(frame: .zero)

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.3

        return view
    }()

    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)

        label.font = .systemFont(ofSize: 24)
        label.textColor = Colors.text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail

        return label
    }()

    // MARK: - Setup

    override func setupViewHierarchy() {
        super.setupViewHierarchy()

        [imageView, maskingView, nameLabel].forEach(contentView.addSubview)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            maskingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            maskingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            maskingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            maskingView.heightAnchor.constraint(equalToConstant: 64),

            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
