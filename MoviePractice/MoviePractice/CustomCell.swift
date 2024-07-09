import UIKit
import SnapKit

class CustomCell: UITableViewCell, ReuseIdentifier {
    lazy var stackViewHorizontal: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewFirst, stackViewSecond])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var stackViewFirst: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        return stackView
    }()
    
    lazy var stackViewSecond: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgLabel, releaseLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imgLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .right
        return label
    }()
    
    lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .right
        return label
    }()
    
    // 도대체 style과 reuseIdentifier는 무엇인가?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayouts()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("[CustomCell] required error")
    }
    
    private func setLayouts() {
        [stackViewHorizontal,
         stackViewFirst,
         stackViewSecond].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        stackViewHorizontal.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(10)
        }
        
        stackViewFirst.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        stackViewSecond.snp.makeConstraints {
            $0.width.equalTo(stackViewHorizontal.snp.width).multipliedBy(0.7)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}

extension CustomCell {
    func bindData(model: Movie) {
        titleLabel.text = model.title
        imgLabel.text = model.img
        releaseLabel.text = model.release
    }
}
