import Foundation

protocol ReuseIdentifier {
    // 연산 프로퍼티 (get)
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifier {
    // 연산 프로퍼티 (return)
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// 저장 프로퍼티는 set
