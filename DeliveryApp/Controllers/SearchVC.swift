import UIKit
import SnapKit

class SearchViewController: UIViewController {
    private var searchAdresses: [AddressModel] = []
    private var timer: Timer?

    weak var delegate: SearchViewControllerDelegate?

    lazy var searchBar: UITextField = {
        let search = UITextField()
        search.placeholder = "Введите адрес"
        search.clearButtonMode = .whileEditing
        search.font = .systemFont(ofSize: 16)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: search.frame.height))
        let imageView = UIImageView()
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass")
        imageView.image = magnifyingGlassImage
        imageView.frame = CGRect(x: 15, y: -10, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "Description")
        view.addSubview(imageView)
        search.leftViewMode = .always
        search.leftView = view
        search.delegate = self
        search.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        search.becomeFirstResponder()
        return search
    }()
    
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        addView()
        setupUI()
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: {[weak self] (_) in
            guard let self = self else { return }
            NetworkManager.shared.searchAdressRequest(query: textField.text ?? "") { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let adresses):
                    guard let adress = adresses.suggestions else { return }
                    self.searchAdresses = adress
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

// - MARK: Setup UI

extension SearchViewController {
    private func addView() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        line.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }

    private func setupUI() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(26)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }

        line.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(14)
            make.left.equalTo(view.snp.left).offset(15)
            make.right.equalTo(view.snp.right).offset(-15)
            make.height.equalTo(1)
        }

        tableView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
            make.top.equalTo(line.snp.bottom)
        }
    }
}

// - MARK: Setup TableView

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchAdresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell {
            cell.configure(adress: searchAdresses[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adress = searchAdresses[indexPath.row]
        delegate?.putAdress(adress: adress.value ?? "")
        dismiss(animated: true)
    }
}

// - MARK: TextField Delegate

extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && string == " " {
            return false
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchBar.endEditing(true)
    }
}

// - MARK: Delegate

protocol SearchViewControllerDelegate: AnyObject {
    func putAdress(adress: String)
}
