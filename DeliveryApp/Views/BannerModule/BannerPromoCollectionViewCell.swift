import UIKit
import SnapKit

class BannerPromoCollectionViewCell: UICollectionViewCell {
    static let identifier = "secondBlockCollectionViewCell"

    private let picture: UIImageView = {
       let picture = UIImageView()
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds =  true
        picture.layer.cornerRadius = 12
        return picture
    }()

    private let firstLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
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
        addSubview(picture)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        picture.addSubview(firstLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        picture.addSubview(secondLabel)

        picture.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }

        secondLabel.snp.makeConstraints { make in
            make.bottom.equalTo(picture.snp.bottom).offset(-18)
            make.left.equalTo(picture.snp.left).offset(14)
        }

        firstLabel.snp.makeConstraints { make in
            make.bottom.equalTo(secondLabel.snp.top)
            make.left.equalTo(picture.snp.left).offset(14)
        }
    }

    func configure(data: String) {
        firstLabel.text = "В честь открытия"
        secondLabel.text = "Скидки  20%"
        picture.image = UIImage(named: data)
    }

    func configureLast(data: String) {
        picture.image = UIImage(named: data)
    }
}
