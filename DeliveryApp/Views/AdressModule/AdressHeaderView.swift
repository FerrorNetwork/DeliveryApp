
import UIKit
import SnapKit

class AdressTableViewCell: UITableViewCell {
    static let identifier = "adressTableViewCell"

    private let hamburgerMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "HamburgerMenu"), for: .normal)
        button.tintColor = .darkGray
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка"
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(named: "Description")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let arrowDownImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.down")
        image.tintColor = UIColor(named: "Description")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var adressButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.zPosition = 0
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        selectionStyle = .none
    }

    private func commonInit() {
        contentView.addSubview(hamburgerMenuButton)
        hamburgerMenuButton.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(18)
            make.top.equalTo(contentView.snp.top).offset(27)
            make.bottom.equalTo(contentView.snp.bottom).offset(-27)
            make.width.height.equalTo(25)
        }

        contentView.addSubview(deliveryLabel)
        deliveryLabel.snp.makeConstraints { make in
            make.left.equalTo(hamburgerMenuButton.snp.right).offset(28)
            make.top.equalTo(hamburgerMenuButton.snp.top).offset(-4)
        }

        contentView.addSubview(adressLabel)
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel.snp.bottom)
            make.left.equalTo(hamburgerMenuButton.snp.right).offset(28)
            make.height.equalTo(20)
        }

        contentView.addSubview(arrowDownImage)
        arrowDownImage.snp.makeConstraints { make in
            make.left.equalTo(adressLabel.snp.right).offset(6)
            make.right.lessThanOrEqualTo(contentView.snp.right).offset(-10)
            make.centerY.equalTo(adressLabel.snp.centerY)
            make.width.equalTo(20)
        }

        contentView.addSubview(adressButton)
        adressButton.snp.makeConstraints { make in
            make.top.equalTo(adressLabel.snp.top)
            make.left.equalTo(adressLabel.snp.left)
            make.right.equalTo(arrowDownImage.snp.right)
            make.bottom.equalTo(adressLabel.snp.bottom)
        }
    }

    func configure(adress: String) {
        adressLabel.text = adress
    }
}
