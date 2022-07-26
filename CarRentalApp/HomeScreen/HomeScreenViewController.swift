
import UIKit

final class HomeScreenViewController: UIViewController {

    private let homeScreen = HomeUIView()
    private let collectionManager: BrandsCollectionViewManager
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private let userDefaultProvider: UserDefaultProvider
    private let userDefault = UserDefaults.standard
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider, userDefaultProvider: UserDefaultProvider) {
        self.dataProvider = dataProvider
        self.rentalModel = rentalModel
        self.historyDataProvider = historyDataProvider
        self.userDefaultProvider = userDefaultProvider
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
        tabBarController?.navigationItem.hidesBackButton = true
    }
    
}

extension HomeScreenViewController: HomeScreenProtocol {
    
    func viewAllButtonTapped(_ sender: UIButton) {
        pushModule(withViewController: CarsViewController(dataProvider: dataProvider, rentalModel: rentalModel, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider))
    }
    
    func containerForCarViewTapped(_ sender: UIView) {
        pushModule(withViewController: CarsViewController(dataProvider: dataProvider, rentalModel: rentalModel, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider))
    }
    
}
