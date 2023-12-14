import UIKit

class StockBlockCollectionView: UITableViewCell {
    static let identifier = "stockBlockCollectionView"

    private var collectionView: UICollectionView?

    private var arrayOfStock: [ProductModel] = []

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
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 102, height: 208)
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.register(StockBlockCollectionViewCell.self, forCellWithReuseIdentifier: StockBlockCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView?.backgroundColor = .white
        contentView.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints { make in
            make.height.equalTo(208)
            make.left.top.bottom.right.equalToSuperview()
        }
    }

    func configure(stock: [ProductModel]) {
        arrayOfStock.append(contentsOf: stock)
    }
}

extension StockBlockCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfStock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockBlockCollectionViewCell.identifier, for: indexPath) as? StockBlockCollectionViewCell {
                cell.configure(data: arrayOfStock[indexPath.row])
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockBlockCollectionViewCell.identifier, for: indexPath) as? StockBlockCollectionViewCell {
                cell.configureLast(data: arrayOfStock[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
