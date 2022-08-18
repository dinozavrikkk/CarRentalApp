
import UIKit

final class CarsViewController: UIViewController {
    
    private let tableManager: CarsTableViewManager
    private let collectionManager: BrandsCollectionViewManager
    private let carsView = CarsUIView()
    private let userDefaultProvider: UserDefaultProvider
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider, userDefaultProvider: UserDefaultProvider) {
        self.tableManager = CarsTableViewManager(dataProvider: dataProvider, historyDataProvider: historyDataProvider)
        self.collectionManager = BrandsCollectionViewManager(rentalModel: rentalModel)
        self.userDefaultProvider = userDefaultProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = carsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionAndTableViews()
        configureButtons()
    }

}

//MARK: ChooseCollectionViewDelegate
extension CarsViewController: ChooseCollectionViewDelegate {
    
    func updateCellsInTable(dataProvider: CarsDataProvider) {
        tableManager.dataProvider = dataProvider

        carsView.carsTableView.beginUpdates()
        carsView.carsTableView.reloadSections([0, 0], with: .right)
        carsView.carsTableView.endUpdates()
    }
        
}

//MARK: PushToBookingDelegate
extension CarsViewController: PushToBookingDelegate {
   
    func cellDidTap(cars: CarsTable, historyDataProvider: HistoryDataProvider) {
        let vcBooking = BookingViewController(cars: cars, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider)
        pushModule(withViewController: vcBooking)
    }
    
}

//MARK: UIGestureRecognizerDelegate
extension CarsViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
}

//MARK: Click processing, Configure buttons and views
private extension CarsViewController {
    
    func configureCollectionAndTableViews() {
        carsView.carsTableView.delegate = tableManager
        carsView.carsTableView.dataSource = tableManager
        carsView.brandsCollectionView.delegate = collectionManager
        carsView.brandsCollectionView.dataSource = collectionManager
        tableManager.delegatePushBooking = self
        collectionManager.delegateChoosingListCar = self
        carsView.brandsCollectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
        carsView.carsTableView.register(CarsTableViewCell.self, forCellReuseIdentifier: "CarsTableViewCell")
        carsView.carsTableView.separatorStyle = .none
        carsView.carsTableView.rowHeight = UITableView.automaticDimension
    }
    
    func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
