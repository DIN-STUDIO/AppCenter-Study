import UIKit
import SnapKit

class CustomButton:UIButton {
    let buttonTitle: String
    var buttonAction: (() -> ())?
    
    init(_ title: String) {
        self.buttonTitle = title
        super.init(frame: .zero)
        self.setLayouts()
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        buttonAction?()
    }
    
    private func setLayouts() {
        self.backgroundColor = .systemBlue
        self.setTitle(buttonTitle, for: .normal)
        self.layer.cornerRadius = 10
    }
}
