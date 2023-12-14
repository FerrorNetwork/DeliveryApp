import UIKit
import SnapKit

class HomeViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AdressTableViewCell.self, forCellReuseIdentifier: AdressTableViewCell.identifier)
        tableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: SearchBarTableViewCell.identifier)
        tableView.register(PromoBlockCollectionView.self, forCellReuseIdentifier: PromoBlockCollectionView.identifier)
        tableView.register(BannerPromoCollectionView.self, forCellReuseIdentifier: BannerPromoCollectionView.identifier)
        tableView.register(StockHeaderTableViewCell.self, forCellReuseIdentifier: StockHeaderTableViewCell.identifier)
        tableView.register(StockBlockCollectionView.self, forCellReuseIdentifier: StockBlockCollectionView.identifier)
        tableView.register(CatalogHeaderTableViewCell.self, forCellReuseIdentifier: CatalogHeaderTableViewCell.identifier)
        tableView.register(CatalogCollectionView.self, forCellReuseIdentifier: CatalogCollectionView.identifier)
        return tableView
    }()

    private var adressText: String = "Адрес"

    private let localData = LocalData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

    @objc func adressButtonTapped() {
        let vc = SearchViewController()
        vc.delegate = self
        if adressText != "Адрес" {
            vc.searchBar.text = adressText
        }
        present(vc, animated: true)
    }
}

// MARK: TableView Delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 8
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: AdressTableViewCell.identifier,
                for: indexPath
            ) as? AdressTableViewCell {
                cell.configure(adress: adressText)
                cell.adressButton.addTarget(self, action: #selector(adressButtonTapped), for: .touchUpInside)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: SearchBarTableViewCell.identifier,
                for: indexPath
            ) as? SearchBarTableViewCell {
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: PromoBlockCollectionView.identifier,
                for: indexPath
            ) as? PromoBlockCollectionView {
                cell.configure(promoData: localData.arrayOfPromo)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: BannerPromoCollectionView.identifier,
                for: indexPath
            ) as? BannerPromoCollectionView {
                cell.configure(photos: localData.arrayOfBanners)
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: StockHeaderTableViewCell.identifier,
                for: indexPath
            ) as? StockHeaderTableViewCell {
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: StockBlockCollectionView.identifier,
                for: indexPath
            ) as? StockBlockCollectionView {
                cell.configure(stock: localData.arrayOfStock)
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: CatalogHeaderTableViewCell.identifier,
                for: indexPath
            ) as? CatalogHeaderTableViewCell {
                return cell
            }
        case 7:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: CatalogCollectionView.identifier,
                for: indexPath
            ) as? CatalogCollectionView {
                cell.configure(catalog: localData.arrayOfCatalog)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        switch indexPath.row {
        case 0:
            print("Блок с адресом")
        case 1:
            print("Блок с поиском")
        default:
            return
        }
    }
}

// MARK: Delegate

extension HomeViewController: SearchViewControllerDelegate {
    func putAdress(adress: String) {
        adressText = adress
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
    }
}
