import UIKit

class BannerPromoCollectionView: UITableViewCell {
    static let identifier = "bannerPromoCollectionView"

    private var collectionView: UICollectionView?

    private var arrayOfPhotos: [String] = []

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
        flowLayout.itemSize = CGSize(width: 290, height: 115)
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 8.0
        flowLayout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.register(BannerPromoCollectionViewCell.self, forCellWithReuseIdentifier: BannerPromoCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView?.backgroundColor = .white
        contentView.addSubview(collectionView ?? UICollectionView())

        collectionView?.snp.makeConstraints { make in
            make.height.equalTo(115)
            make.left.top.bottom.right.equalToSuperview()
        }
    }

    func configure(photos: [String]) {
        arrayOfPhotos.append(contentsOf: photos)
    }
}

extension BannerPromoCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerPromoCollectionViewCell.identifier, for: indexPath) as? BannerPromoCollectionViewCell {
                cell.configure(data: arrayOfPhotos[indexPath.row])
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerPromoCollectionViewCell.identifier, for: indexPath) as? BannerPromoCollectionViewCell {
                cell.configureLast(data: arrayOfPhotos[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Блок с промо баннерами \(indexPath.row)")
    }
}
