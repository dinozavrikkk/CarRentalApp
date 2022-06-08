//
//  BookingViewController.swift
//  CarRentalApp
//
//  Created by admin on 13.05.2022.
//

import UIKit

class BookingViewController: UIViewController {

    private var counter: Int = 2
    let bookingView: BookingUIView
    private var cars: CarsTable
    
    init(cars: CarsTable, historyDataProvider: HistoryDataProvider) {
        self.bookingView = BookingUIView(historyDataProvider: historyDataProvider)
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        
        view = bookingView
        bookingView.delegateBooking = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookingView.totalPriceLabel.text = cars.price
        bookingView.bigImageCar.image = cars.carPhoto
        bookingView.carModelLabel.text = cars.stamp + " " + cars.model
        bookingView.pricePerDayLabel.text = "$\(cars.price) per day"
        bookingView.infoAboutCarTextView.text = cars.infoAboutCar
 
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

extension BookingViewController: BookingButtonsProtocol {
    
    func bookButtonTapped(_ sender: UIButton, historyDataProvider: HistoryDataProvider) {
        cars.price = bookingView.totalPriceLabel.text!
        cars.rentalDays = (bookingView.counterButton.titleLabel?.text)!
        let vcPayment = PaymentViewController(cars: cars, historyDataProvider: historyDataProvider)
        navigationController?.pushViewController(vcPayment, animated: true)
    }
    
    func counterButtonTapped(_ sender: UIButton) {
        switch counter {
        case 1:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("1", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 1)"
        case 2:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("2", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 2)"
        case 3:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("3", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 3)"
        case 4:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("4", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 4)"
        case 5:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("5", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 5)"
        case 6:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("6", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 6)"
        case 7:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("7", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 7)"
        case 8:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("8", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 8)"
        case 9:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("9", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 9)"
        case 10:
            bookingView.totalPriceLabel.text = cars.price
            sender.setTitle("10", for: .normal)
            bookingView.totalPriceLabel.text = "\(Int(bookingView.totalPriceLabel.text!)! * 10)"
        default:
            counter = 0
        }
        counter += 1
    }
    
}

