import UIKit
import SnapKit

class ShowAllView: UIView {
    private let showAllImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "showAllButton")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(named: "Background")
        layer.cornerRadius = 12.5

        showAllImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(showAllImage)

        showAllImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
