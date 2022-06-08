//
//  HomeScreenViewController.swift
//  CarRentalApp
//
//  Created by admin on 08.05.2022.
//

import UIKit

class HomeScreenViewController: UIViewController {

    private let homeScreen = HomeUIView()
    private let collectionManager: BrandsCollectionViewManager
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private let userDefault = UserDefaults.standard
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider) {
        self.dataProvider = dataProvider
        self.rentalModel = rentalModel
        self.historyDataProvider = historyDataProvider
        self.collectionManager = BrandsCollectionViewManager(rentalModel: rentalModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = homeScreen
        homeScreen.brandsCollectionView.delegate = collectionManager
        homeScreen.brandsCollectionView.dataSource = collectionManager
        homeScreen.delegateHome = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen.brandsCollectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
//        navigationItem.hidesBackButton = true
        //tabBarController?.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go out", style: .done, target: self, action: #selector(rightButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc private func rightButtonDidTap() {
       // userDefault.setValue(false, forKey: "isLogin")
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension HomeScreenViewController: HomeScreenProtocol {
    
    func viewAllButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(CarsViewController(dataProvider: dataProvider, rentalModel: rentalModel, historyDataProvider: historyDataProvider), animated: true)
    }
    
    
}
