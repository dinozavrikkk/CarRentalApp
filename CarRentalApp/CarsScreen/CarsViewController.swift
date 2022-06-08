//
//  CarsViewController.swift
//  CarRentalApp
//
//  Created by admin on 09.05.2022.
//

import UIKit

class CarsViewController: UIViewController {
    
    private let tableManager: CarsTableViewManager
    private let collectionManager: BrandsCollectionViewManager
    private let carsView = CarsUIView()
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider) {
        self.tableManager = CarsTableViewManager(dataProvider: dataProvider, historyDataProvider: historyDataProvider)
        self.collectionManager = BrandsCollectionViewManager(rentalModel: rentalModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = carsView
        carsView.carsTableView.delegate = tableManager
        carsView.carsTableView.dataSource = tableManager
        carsView.brandsCollectionView.delegate = collectionManager
        carsView.brandsCollectionView.dataSource = collectionManager
        tableManager.delegatePushBooking = self
        collectionManager.delegateChoosingListCar = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsView.brandsCollectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
        carsView.carsTableView.register(CarsTableViewCell.self, forCellReuseIdentifier: "CarsTableViewCell")
        carsView.carsTableView.separatorStyle = .none
        carsView.carsTableView.rowHeight = UITableView.automaticDimension
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

extension CarsViewController: ChooseCollectionViewProtocol {
    
    func updateCellsInTable(dataProvider: CarsDataProvider) {
        tableManager.dataProvider = dataProvider

        carsView.carsTableView.beginUpdates()
        carsView.carsTableView.reloadSections([0, 0], with: .right)
        carsView.carsTableView.endUpdates()
    }
        
}

extension CarsViewController: PushToBookingProtocol {
   
    func cellDidTap(cars: CarsTable, historyDataProvider: HistoryDataProvider) {
        let vcBooking = BookingViewController(cars: cars, historyDataProvider: historyDataProvider)
        navigationController?.pushViewController(vcBooking, animated: true)
    }    
}
