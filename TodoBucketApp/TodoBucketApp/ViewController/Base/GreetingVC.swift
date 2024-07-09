import UIKit
import SnapKit

final class GreetingVC: UIViewController {
    lazy var signInUpStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var signUpButton: Button = {
        let button = Button(title: "신규 회원가입", backgroundColor: .mainButtonColor)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        [signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setConstraints()
    }
}

