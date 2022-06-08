//
//  PaymentViewController.swift
//  CarRentalApp
//
//  Created by admin on 15.05.2022.
//

import UIKit

class PaymentViewController: UIViewController {

    private let paymentView: PaymentUIView
    private let cars: CarsTable

    init(cars: CarsTable, historyDataProvider: HistoryDataProvider) {
        self.cars = cars
        self.paymentView = PaymentUIView(historyDataProvider: historyDataProvider)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = paymentView
        paymentView.delegatePayment = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentView.totalPriceLabel.text = "Total price: $\(cars.price)"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButtonWhite"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension PaymentViewController: PaymentProtocol {
   
    func payButtonTapped(_ sender: UIButton, _ label: UILabel, historyDataProvider: HistoryDataProvider) {
        if !paymentView.pass.isEmpty && !paymentView.data.isEmpty && !paymentView.holder.isEmpty && !paymentView.number.isEmpty {
            label.text = "Succesfully  Done"
            label.textColor = .green
            historyDataProvider.addCarToTable(carInfo: cars)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        } else {
            label.text = "Check the required fields"
            label.textColor = .red
        }
        
        if paymentView.isCompleted == false {
            guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else { return }
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else { return }
                print("Joke:\n\(joke.setup)\n\(joke.delivery)")
            }
            task.resume()
        } else {
            print("Set saving card data!")
        }
        
        if paymentView.isCompleted == false {
            if !paymentView.pass.isEmpty && !paymentView.data.isEmpty && !paymentView.holder.isEmpty && !paymentView.number.isEmpty {
                UserDefaults.standard.set(paymentView.pass, forKey: KeysDefaults.keyPass)
                UserDefaults.standard.set(paymentView.data, forKey: KeysDefaults.keyData)
                UserDefaults.standard.set(paymentView.holder, forKey: KeysDefaults.keyHolder)
                UserDefaults.standard.set(paymentView.number, forKey: KeysDefaults.keyNumber)
            } else {
                UserDefaults.standard.removeObject(forKey: KeysDefaults.keyPass)
                UserDefaults.standard.removeObject(forKey: KeysDefaults.keyData)
                UserDefaults.standard.removeObject(forKey: KeysDefaults.keyHolder)
                UserDefaults.standard.removeObject(forKey: KeysDefaults.keyNumber)
            }
        }
    }
    
}
