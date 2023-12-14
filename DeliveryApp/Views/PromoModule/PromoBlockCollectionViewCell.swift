import UIKit
import SnapKit

class PromoBlockCollectionViewCell: UICollectionViewCell {
    static let identifier = "firstBlockCollectionViewCell"

    private let picture: UIImageView = {
       let picture = UIImageView()
        picture.contentMode = .scaleAspectFit
        picture.clipsToBounds =  true
        return picture
    }()
    private let textLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12)
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
        picture.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picture)
        addSubview(textLabel)

        picture.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.left.top.equalToSuperview().offset(8)
        }

        textLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(picture.snp.bottom).offset(12)
        }
    }

    func configure(data: ImageModel) {
        textLabel.text = data.name
        picture.image = UIImage(named: data.image)
    }
}
