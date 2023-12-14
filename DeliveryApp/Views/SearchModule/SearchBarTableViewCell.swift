import UIKit
import SnapKit

class SearchBarTableViewCell: UITableViewCell {
    static let identifier = "searchBarTableViewCell"

    lazy var searchBar: UITextField = {
        let search = UITextField()
        search.placeholder = "Поиск товара"
        search.font = .systemFont(ofSize: 14)
        search.backgroundColor = UIColor(named: "Background")
        search.layer.cornerRadius = 5
        search.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: search.frame.height))
        search.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: search.frame.height))
        let imageView = UIImageView()
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass")
        imageView.image = magnifyingGlassImage
        imageView.frame = CGRect(x: 0, y: -8, width: 15, height: 15)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "Description")
        view.addSubview(imageView)
        search.rightViewMode = .always
        search.rightView = view
        search.translatesAutoresizingMaskIntoConstraints = false
        search.delegate = self
        return search
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = UIColor(named: "Description")
        button.backgroundColor = UIColor(named: "Background")
        button.layer.cornerRadius = 15
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
        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.height.equalTo(35)
            make.left.equalToSuperview().offset(15)
        }

        contentView.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.left.equalTo(searchBar.snp.right).offset(10)
            make.centerY.equalTo(searchBar.snp.centerY)
            make.height.width.equalTo(30)
        }
    }
}

// MARK: TextField Delegate

extension SearchBarTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchBar.endEditing(true)
    }
}
