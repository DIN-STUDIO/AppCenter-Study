import UIKit
import SnapKit

final class MainViewController: UIViewController {
    lazy var heightTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "키 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var weightTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "몸무게 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var submitButton = CustomButton("BMI 계산하기")

    private func setLayouts() {
        [heightTextField,
         weightTextField,
         submitButton
         ].forEach { v in
            self.view.addSubview(v)
        }
    }
    
    private func setConstraints() {
        heightTextField.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.centerY.equalTo(self.view).offset(-30)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(40)
        }
        
        weightTextField.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.centerY.equalTo(self.view).offset(30)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(40)
        }
        
        submitButton.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(weightTextField.snp.bottom).offset(100)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    private func calculateBMI(h: String, w: String) -> String {
        guard let height = Double(h) else { return "Height Optional Binding Error" }
        guard let weight = Double(w) else { return "Height Optional Binding Error" }
        
        let resultDouble = weight / pow(height / 100, 2)
        let result = String(format: "%.1f", resultDouble)
        
        return result
    }
    
    private func determineBMI(result: String) -> String {
        guard let doubleValue = Double(result) else { return "Optional Error"}
        
        switch doubleValue {
        case 0...18.5:
            return "저체중"
        case 18.5...23:
            return "정상"
        case 23...25:
            return "과체중"
        case 25...:
            return "비만"
        default:
            return "BMI 계산 에러"
        }
    }
    
    private func showAlert(alertMessage: String) {
        let alertController = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "다시 입력", style: .default)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [confirmAction,
         cancelAction
        ].forEach {
            alertController.addAction($0)
        }
        self.present(alertController, animated: true)
    }
    
    private func showModalVC() {
        submitButton.buttonAction = { [weak self] in
            guard let height = self?.heightTextField.text, !height.isEmpty else {
                self?.showAlert(alertMessage: "키를 입력해야됨")
                return
            }
            
            guard let weight = self?.weightTextField.text, !weight.isEmpty else {
                self?.showAlert(alertMessage: "체중을 입력해야됨")
                return
            }
            
            guard let bmiValue = self?.calculateBMI(h: height, w: weight) else { return }
            guard let bmiMessage = self?.determineBMI(result: bmiValue) else { return }
            
            let modalVC = ResultModalViewController(bmiV: bmiValue, bmiM: bmiMessage)
            self?.present(modalVC, animated: true)
            
            self?.heightTextField.text = ""
            self?.weightTextField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setLayouts()
        setConstraints()
        showModalVC()
    }
}

