import UIKit
import SnapKit

class PaleOrangeBtn: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.brightOrange, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        self.backgroundColor = .paleOrange
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("[Button.swift] init(coder:) has not been implemented")
    }
}
