import UIKit
import SnapKit

class StockHeaderTableViewCell: UITableViewCell {
    static let identifier = "stockHeaderTableViewCell"

    private let stockLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.text = "Акции"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showAllView: ShowAllView = {
        let view = ShowAllView(frame: CGRect(x: 0, y: 0, width: 103, height: 25))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(stockLabel)
        stockLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(27)
            make.bottom.equalToSuperview().offset(-18)
        }

        contentView.addSubview(showAllView)
        showAllView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalTo(stockLabel.snp.centerY)
            make.height.equalTo(25)
            make.width.equalTo(103)
        }

        contentView.addSubview(showAllButton)
        showAllButton.snp.makeConstraints { make in
            make.left.equalTo(showAllView.snp.left)
            make.right.equalTo(showAllView.snp.right)
            make.top.equalTo(showAllView.snp.top)
            make.bottom.equalTo(showAllView.snp.bottom)
        }
    }
}
