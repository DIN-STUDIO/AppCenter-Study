import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    var data: Movie
    
    init(movieData: Movie) {
        self.data = movieData
        super.init(nibName: nil, bundle: nil)
    }
    
    // 인터페이스 빌더(스토리보드, xib 파일)을 사용하지 않겠다는 의미
    // 호출할 경우 치명적 오류 발생
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var movieImgLabel: UILabel = {
        let label = UILabel()
        label.text = data.img
        return label
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = data.title
        return label
    }()
    
    private func setUpUI() {
        view.backgroundColor = .darkGray
        
        [movieImgLabel,
         movieTitleLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        movieImgLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(30)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        setUpConstraints()
    }
}
