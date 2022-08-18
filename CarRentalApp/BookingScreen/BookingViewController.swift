
import UIKit

final class BookingViewController: UIViewController {

    private var counter: Int = 2
    let bookingView: BookingUIView
    private var cars: CarsTable
    private let userDefaultProvider: UserDefaultProvider
    
    init(cars: CarsTable, historyDataProvider: HistoryDataProvider, userDefaultProvider: UserDefaultProvider) {
        self.bookingView = BookingUIView(historyDataProvider: historyDataProvider)
        self.userDefaultProvider = userDefaultProvider
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookingView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookingView.delegateBooking = self
        configureViews()
        configureButtons()
    }
}

//MARK: BookingButtonsDelegate
extension BookingViewController: BookingButtonsDelegate {
    
    func bookButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider) {
        cars.price = bookingView.totalPriceLabel.text!
        cars.rentalDays = (bookingView.counterButton.titleLabel?.text)!
        let vcPayment = PaymentViewController(cars: cars, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider)
        pushModule(withViewController: vcPayment)
    }
    
    func counterButtonTapped(_ sender: UIButton) {
        CountingDays.counting(sender: sender, counter: &counter, defaultPrice: &bookingView.totalPriceLabel.text!, carPrice: cars.price)
    }
    
}

//MARK: UIGestureRecognizerDelegate
extension BookingViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

//MARK: Click processing, Configure buttons and views
private extension BookingViewController {
    
    func configureViews() {
        bookingView.totalPriceLabel.text = cars.price
        bookingView.bigImageCar.image = cars.carPhoto
        bookingView.carModelLabel.text = cars.stamp + " " + cars.model
        bookingView.pricePerDayLabel.text = "$\(cars.price) per day"
        bookingView.infoAboutCarTextView.text = cars.infoAboutCar

    }
    
    func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

