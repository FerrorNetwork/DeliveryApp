import UIKit

class CatalogCollectionView: UITableViewCell {
    static let identifier = "catalogCollectionView"

    private var collectionView: UICollectionView?

    private var arrayOfCatalog: [ImageModel] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 108, height: 135)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10.0

        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionView?.backgroundColor = .white
        contentView.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints { make in
            make.height.equalTo(435)
            make.left.top.bottom.right.equalToSuperview()
        }
    }

    func configure(catalog: [ImageModel]) {
        arrayOfCatalog.append(contentsOf: catalog)
    }
}

extension CatalogCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfCatalog.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifier, for: indexPath) as? CatalogCollectionViewCell {
            cell.configure(data: arrayOfCatalog[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
