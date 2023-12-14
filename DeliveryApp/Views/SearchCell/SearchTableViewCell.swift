import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    static let identifier = "searchTableViewCell"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.and.ellipse")
        image.tintColor = UIColor(named: "Description")
        return image
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "Description")
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none
        image.translatesAutoresizingMaskIntoConstraints = false
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(image)
        addSubview(adressLabel)
        addSubview(locationLabel)

        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(16)
            make.width.height.equalTo(20)
        }

        adressLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(18)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(10)
        }

        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(18)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(adressLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    func configure(adress: AddressModel) {
        adressLabel.text = adress.value
        locationLabel.text = adress.unrestrictedValue
    }
}
