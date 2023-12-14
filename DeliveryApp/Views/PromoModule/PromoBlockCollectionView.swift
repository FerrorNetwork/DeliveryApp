import UIKit

class PromoBlockCollectionView: UITableViewCell {
    static let identifier = "promoBlockCollectionView"

    private var collectionView: UICollectionView?

    private var arrayOfPromo: [ImageModel] = []

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
        flowLayout.itemSize = CGSize(width: 90, height: 88)
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.register(PromoBlockCollectionViewCell.self, forCellWithReuseIdentifier: PromoBlockCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView?.backgroundColor = .white
        contentView.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints { make in
            make.height.equalTo(138)
            make.left.top.bottom.right.equalToSuperview()
        }
    }

    func configure(promoData: [ImageModel]) {
        arrayOfPromo.append(contentsOf: promoData)
    }
}

extension PromoBlockCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPromo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoBlockCollectionViewCell.identifier, for: indexPath) as? PromoBlockCollectionViewCell {
            cell.configure(data: arrayOfPromo[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Блок с промо разделами \(indexPath.row)")
    }
}
