import UIKit
import SnapKit

class GreetingVC: UIViewController {
    lazy var signInUpStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private func setUpUI() {
        view.backgroundColor = .orange
        
        [signUpButton,
         signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setConstraints()
    }
}

