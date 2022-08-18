
import UIKit

final class PaymentViewController: UIViewController {

    private let paymentView: PaymentUIView
    private let cars: CarsTable
    private let userDefaultProvider: UserDefaultProvider

    init(cars: CarsTable, historyDataProvider: HistoryDataProvider, userDefaultProvider: UserDefaultProvider) {
        self.cars = cars
        self.paymentView = PaymentUIView(historyDataProvider: historyDataProvider)
        self.userDefaultProvider = userDefaultProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = paymentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentView.delegatePayment = self
        paymentView.addTapGestureToHideKeyboard()
        configureViews()
        configureButtons()
    }
    
    deinit {
        paymentView.removeKeyboardNotification()
    }
}

//MARK: PaymentDelegate
extension PaymentViewController: PaymentDelegate {

    func payButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider) {
        if !(paymentView.passTextField.text?.isEmpty ?? true) && !(paymentView.dateTextField.text?.isEmpty ?? true) && !(paymentView.holderTextField.text?.isEmpty ?? true) && !(paymentView.numberTextField.text?.isEmpty ?? true) {
            historyDataProvider.addCarToTable(carInfo: cars)
            Alerts.getPayNowAlert {
                self.navigationController?.popToRootViewController(animated: true)
            }
            if paymentView.isCompleted == false {
                userDefaultProvider.fetchJoke()
                userDefaultProvider.setUserDataToUserDefaults(pass: paymentView.passTextField.text ?? "", date: paymentView.dateTextField.text ?? "", holder: paymentView.holderTextField.text ?? "", number: paymentView.numberTextField.text ?? "")
            } else {
                userDefaultProvider.deleteUserDataFromUserDefaults()
            }
        } else {
            Alerts.getPayNowWithEmptyAlert()
        }
    }
    
}

//MARK: UIGestureRecognizerDelegate
extension PaymentViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

//MARK: Click processing, Configure buttons and views
extension PaymentViewController {
    
    func configureViews() {
        paymentView.totalPriceLabel.text = "Total price: $\(cars.price)"
    }
    
    func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButtonWhite"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
