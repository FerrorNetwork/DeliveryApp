import UIKit
import SnapKit

class CatalogHeaderTableViewCell: UITableViewCell {
    static let identifier = "catalogHeaderTableViewCell"

    private let stockLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.text = "Каталог"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(stockLabel)
        stockLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(27)
            make.bottom.equalToSuperview().offset(-18)
        }
    }
}
