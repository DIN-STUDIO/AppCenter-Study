import UIKit
import SnapKit

class Button: UIButton {
    init(title: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
    }
    
    convenience init(title: String, backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.init(title: title, titleColor: .white, backgroundColor: backgroundColor, cornerRadius: cornerRadius)
    }
    
    convenience init(title: String, backgroundColor: UIColor) {
        self.init(title: title, titleColor: .white, backgroundColor: backgroundColor, cornerRadius: 15)
    }
    
    convenience init() {
        self.init(title: "", titleColor: .white, backgroundColor: .mainButtonColor, cornerRadius: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("[Button.swift] init(coder:) has not been implemented")
    }
}
