
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userDefault = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        //userDefault.setValue(false, forKey: "isLogin") <-- Для сброса на экран логина!!!
        let isLogin = userDefault.object(forKey: "isLogin") as? Bool ?? false
        
        if isLogin {
            startApp()
        } else {
            startLogin()
        }
        
    }
    
    func startApp() {
        let dataCars = BackendDataModels()
        let carsStorage = CarsStorage(cars: dataCars.dataBMW)
        let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
        let dataProvider = CarsDataProvider(obtainer: obtainer)
        
        let rentalStorageCollection = DataModelExample()
        
        let dataCarsHistory = PatternDataModel()
        let dataModelHistoryCarsTable = DataModelHistoryCarsTable(carHistoryTable: dataCarsHistory.dataPattern)
        let historyDataProvider = HistoryDataProvider(dataModelHistory: dataModelHistoryCarsTable)
        
        let homeVC = UINavigationController(rootViewController: HomeScreenViewController(dataProvider: dataProvider, rentalModel: rentalStorageCollection, historyDataProvider: historyDataProvider))
        let recentVC = RecentHistoryViewController(dataProviderHistory: historyDataProvider)
        let mapVC = MapViewController()
        let driverVC = DriverProfileViewController()
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [homeVC, recentVC, mapVC, driverVC]
        
        tabBarVC.tabBar.tintColor = UIColor(red: 0.976, green: 0.706, blue: 0.004, alpha: 1)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["square.grid.2x2.fill", "bell.fill", "mappin.circle.fill", "gearshape.fill"]
        
        for element in 0..<items.count {
            items[element].image = UIImage(systemName: images[element])
        }
        let navigationController = UINavigationController(rootViewController: tabBarVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func startLogin() {
        let dataCars = BackendDataModels()
        let carsStorage = CarsStorage(cars: dataCars.dataBMW)
        let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
        let dataProvider = CarsDataProvider(obtainer: obtainer)
        
        let rentalStorageCollection = DataModelExample()
        
        let dataCarsHistory = PatternDataModel()
        let dataModelHistoryCarsTable = DataModelHistoryCarsTable(carHistoryTable: dataCarsHistory.dataPattern)
        let historyDataProvider = HistoryDataProvider(dataModelHistory: dataModelHistoryCarsTable)
        
        let loginVC = LoginViewController(dataProvider: dataProvider, rentalModel: rentalStorageCollection, historyDataProvider: historyDataProvider)
        let navigationController = UINavigationController(rootViewController: loginVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

