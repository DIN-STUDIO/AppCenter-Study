import UIKit
import SnapKit

final class ResultModalViewController: UIViewController {
    let resultBMIValue: String
    let resultBMIMessage: String
    
    init(bmiV: String, bmiM: String) {
        self.resultBMIValue = bmiV
        self.resultBMIMessage = bmiM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var guideMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI 결과값"
        return label
    }()
    
    lazy var resultBMILabel: UILabel = {
        let label = UILabel()
        label.text = resultBMIValue
        return label
    }()
    
    lazy var resultMessageLabel: UILabel = {
        let label = UILabel()
        label.text = resultBMIMessage
        return label
    }()
    
    lazy var recalculateButton = CustomButton("다시 계산")
    
    private func dismissModalVC() {
        recalculateButton.buttonAction = {
            self.dismiss(animated: true)
        }
    }
    
    private func setLayouts() {
        [guideMessageLabel,
         resultBMILabel,
         resultMessageLabel,
         recalculateButton
         ].forEach { v in
            self.view.addSubview(v)
        }
    }
    
    private func setConstraints() {
        guideMessageLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(200)
        }
        
        resultBMILabel.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(guideMessageLabel.snp.bottom).offset(30)
        }
        
        resultMessageLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(resultBMILabel.snp.bottom).offset(30)
        }
        
        recalculateButton.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(resultMessageLabel.snp.bottom).offset(100)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayouts()
        setConstraints()
        dismissModalVC()
    }
}
