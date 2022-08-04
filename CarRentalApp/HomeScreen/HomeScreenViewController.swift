
import UIKit

final class HomeScreenViewController: UIViewController {

    private let homeScreen = HomeUIView()
    private let collectionManager: BrandsCollectionViewManager
    private let dataProvider: CarsDataProvider
    private let rentalModel: DataModelExample
    private let historyDataProvider: HistoryDataProvider
    private let userDefaultProvider: UserDefaultProvider
    private let popularCarsProvider: PopularCarsDataProvider
    private let userDefault = UserDefaults.standard
    
    init(dataProvider: CarsDataProvider, rentalModel: DataModelExample, historyDataProvider: HistoryDataProvider, userDefaultProvider: UserDefaultProvider, popularCarsProvider: PopularCarsDataProvider) {
        self.dataProvider = dataProvider
        self.rentalModel = rentalModel
        self.historyDataProvider = historyDataProvider
        self.userDefaultProvider = userDefaultProvider
        self.popularCarsProvider = popularCarsProvider
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
        homeScreen.carsTableView.delegate = self
        homeScreen.carsTableView.dataSource = self
        homeScreen.delegateHome = self

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen.brandsCollectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
        homeScreen.carsTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        homeScreen.carsTableView.separatorStyle = .none
        homeScreen.carsTableView.rowHeight = UITableView.automaticDimension
        configureButtons()
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        popularCarsProvider.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        cell.update(dataModel: popularCarsProvider.getCar(for: indexPath))
        return cell
    }
    
}

//MARK: HomeScreenDelegate
extension HomeScreenViewController: HomeScreenDelegate {
    
    func switchingToTheCarScreenTapped() {
        pushModule(withViewController: CarsViewController(dataProvider: dataProvider, rentalModel: rentalModel, historyDataProvider: historyDataProvider, userDefaultProvider: userDefaultProvider))
    }
    
}

//MARK: Configure buttons
private extension HomeScreenViewController {
    
    func configureButtons() {
        tabBarController?.navigationItem.hidesBackButton = true
    }
    
}

