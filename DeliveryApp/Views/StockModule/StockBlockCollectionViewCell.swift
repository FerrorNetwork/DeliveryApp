import UIKit
import SnapKit

class StockBlockCollectionViewCell: UICollectionViewCell {
    static let identifier = "thirdBlockCollectionViewCell"

    private let picture: UIImageView = {
       let picture = UIImageView()
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds =  true
        picture.layer.cornerRadius = 12
        return picture
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.numberOfLines = 0
        return label
    }()

    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(named: "Description")
        return label
    }()

    private let saleLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let newLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor(red: 1, green: 0.626, blue: 0.199, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Новинка"
        return label
    }()

    private let largeView: UIView = {
        let image = UIView()
        image.backgroundColor = UIColor(red: 1, green: 0.827, blue: 0.204, alpha: 1)
        image.layer.cornerRadius = 14
        return image
    }()

    private let plusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thirdBlock1-3")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let intLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "1"
        return label
    }()

    private let smallView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thirdBlock2-2")
        return image
    }()

    private let priceLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .red
        return label
    }()

    private let priceSaleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
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
        backgroundColor = UIColor(named: "Background")
        picture.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picture)
        saleLabel.translatesAutoresizingMaskIntoConstraints = false
        picture.addSubview(saleLabel)
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        picture.addSubview(newLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weightLabel)
        largeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(largeView)
        plusImage.translatesAutoresizingMaskIntoConstraints = false
        largeView.addSubview(plusImage)
        intLabel.translatesAutoresizingMaskIntoConstraints = false
        largeView.addSubview(intLabel)
        smallView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(smallView)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceLabel)
        priceSaleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceSaleLabel)

        picture.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(102)
        }

        saleLabel.snp.makeConstraints { make in
            make.top.equalTo(picture.snp.top).offset(5)
            make.left.equalTo(picture.snp.left).offset(5)
            make.height.equalTo(15)
            make.width.equalTo(38)
        }

        newLabel.snp.makeConstraints { make in
            make.right.equalTo(picture.snp.right).offset(-5)
            make.top.equalTo(picture.snp.top).offset(5)
            make.height.equalTo(15)
            make.width.equalTo(49)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(picture.snp.bottom).offset(5)
        }

        weightLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom)
        }

        largeView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.bottom.equalToSuperview().offset(-5)
            make.height.equalTo(30)
        }

        plusImage.snp.makeConstraints { make in
            make.left.equalTo(largeView.snp.left).offset(8)
            make.top.equalTo(largeView.snp.top).offset(8)
            make.bottom.equalTo(largeView.snp.bottom).offset(-8)
            make.right.equalTo(largeView.snp.right).offset(-8)
        }

        intLabel.snp.makeConstraints { make in
            make.centerX.equalTo(largeView.snp.centerX)
            make.centerY.equalTo(largeView.snp.centerY)
        }

        smallView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().offset(-5)
            make.height.equalTo(30)
        }

        priceSaleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
        }

        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceSaleLabel.snp.top)
            make.left.equalToSuperview().offset(5)
        }
    }

    func configure(data: ProductModel) {
        picture.image = UIImage(named: data.image)
        saleLabel.text = data.sale
        descriptionLabel.text = data.name
        weightLabel.text = data.weight
        smallView.isHidden = true
        priceLabel.isHidden = true
        priceSaleLabel.isHidden = true
    }

    func configureLast(data: ProductModel) {
        picture.image = UIImage(named: data.image)
        saleLabel.text = data.sale
        descriptionLabel.text = data.name
        weightLabel.text = data.weight
        largeView.isHidden = true
        priceLabel.attributedText = NSAttributedString(string: data.price ?? "", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        priceSaleLabel.text = data.salePrice
        newLabel.isHidden = true
    }
}
