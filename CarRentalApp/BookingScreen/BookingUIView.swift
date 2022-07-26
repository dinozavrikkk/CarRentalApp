
import UIKit

final class BookingUIView: UIView {
    
    private(set) lazy var bigImageCar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "bmwM3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var conteinerForInfo: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let carModelLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "BMW X5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pricePerDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "$24.99 per day"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "24.99"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bookButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Book now", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bookButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let dollarLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "$"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomHorizontalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [dollarLabel, totalPriceLabel].forEach{ stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var upperVerticalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [carModelLabel, pricePerDayLabel, infoAboutCarLabel].forEach{ stack.addArrangedSubview($0) }
        return stack
    }()
    
    private let infoAboutCarLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Information about car:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var counterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        button.layer.cornerRadius = 25
        button.setTitle("1", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(counterButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var conteinerForStatusBar: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var infoAboutCarTextView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.text = "123"
        textView.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        textView.font = .boldSystemFont(ofSize: 16)
        textView.layer.cornerRadius = 20
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    weak var delegateBooking: BookingButtonsProtocol?
    private let historyDataProvider: HistoryDataProvider
    
    init(historyDataProvider: HistoryDataProvider) {
        self.historyDataProvider = historyDataProvider
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [bigImageCar, conteinerForInfo, upperVerticalStackView, bottomHorizontalStackView, bookButton, counterButton, conteinerForStatusBar, infoAboutCarTextView].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            infoAboutCarTextView.topAnchor.constraint(equalTo: upperVerticalStackView.bottomAnchor, constant: 15),
            infoAboutCarTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            infoAboutCarTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            infoAboutCarTextView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForStatusBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            conteinerForStatusBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            conteinerForStatusBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            conteinerForStatusBar.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            counterButton.topAnchor.constraint(equalTo: upperVerticalStackView.bottomAnchor, constant: 195),
            counterButton.leadingAnchor.constraint(equalTo: conteinerForInfo.leadingAnchor, constant: 130),
            counterButton.heightAnchor.constraint(equalToConstant: 50),
            counterButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            bookButton.topAnchor.constraint(equalTo: conteinerForInfo.topAnchor, constant: 380),
            bookButton.leadingAnchor.constraint(equalTo: conteinerForInfo.leadingAnchor, constant: 230),
            bookButton.trailingAnchor.constraint(equalTo: conteinerForInfo.trailingAnchor, constant: -22),
            bookButton.heightAnchor.constraint(equalToConstant: 50),
            bookButton.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            bottomHorizontalStackView.topAnchor.constraint(equalTo: upperVerticalStackView.bottomAnchor, constant: 255),
            bottomHorizontalStackView.leadingAnchor.constraint(equalTo: conteinerForInfo.leadingAnchor, constant: 22),
            bottomHorizontalStackView.widthAnchor.constraint(equalToConstant: 150),
            bottomHorizontalStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            upperVerticalStackView.topAnchor.constraint(equalTo: conteinerForInfo.topAnchor, constant: 28),
            upperVerticalStackView.leadingAnchor.constraint(equalTo: conteinerForInfo.leadingAnchor, constant: 22),
            upperVerticalStackView.trailingAnchor.constraint(equalTo: conteinerForInfo.trailingAnchor, constant: -100),
            upperVerticalStackView.heightAnchor.constraint(equalToConstant: 105)
        ])
        
        NSLayoutConstraint.activate([
            bigImageCar.topAnchor.constraint(equalTo: self.topAnchor, constant: 145),
            bigImageCar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34),
            bigImageCar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            bigImageCar.heightAnchor.constraint(equalToConstant: 207),
            bigImageCar.widthAnchor.constraint(equalToConstant: 360)
        ])
        
        NSLayoutConstraint.activate([
            conteinerForInfo.topAnchor.constraint(equalTo: bigImageCar.bottomAnchor, constant: 30),
            conteinerForInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            conteinerForInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            conteinerForInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20)
        ])
        
    }
    
    @objc private func counterButtonDidTap(_ sender: UIButton) {
        delegateBooking?.counterButtonTapped(counterButton)
    }
    
    @objc private func bookButtonDidTap(_ sender: UIButton) {
        delegateBooking?.bookButtonTapped(bookButton, historyDataProvider: historyDataProvider)
    }
    
}
