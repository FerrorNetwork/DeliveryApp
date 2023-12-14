import UIKit
import SnapKit

class CatalogCollectionViewCell: UICollectionViewCell {
    static let identifier = "fourthBlockCollectionViewCell"

    private let picture: UIImageView = {
        let picture = UIImageView()
        picture.contentMode = .scaleAspectFit
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 12
        return picture
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        layer.cornerRadius = 12
        picture.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picture)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)

        picture.snp.makeConstraints { make in
            make.right.left.top.equalToSuperview()
            make.height.equalTo(95)
        }

        textLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
    }

    func configure(data: ImageModel) {
        picture.image = UIImage(named: data.image)
        textLabel.text = data.name
        backgroundColor = data.color
    }
}
