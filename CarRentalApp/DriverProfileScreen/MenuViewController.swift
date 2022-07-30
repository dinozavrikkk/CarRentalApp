
import UIKit

final class MenuViewController: UIViewController {
    
    private let menuView = MenuView()
    private var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        
        menuView.delegateGoOutButton = self
    }
    
}

//MARK: ExitingTheAppDelegate
extension MenuViewController: ExitingTheAppDelegate {
    
    func goOutButtonTapped() {
        Alerts.getGoOutAlert { [weak self] in
            let startLoginFactory = StartLoginFactory()
            self?.userDefault.setValue(false, forKey: "isLogin")
            
            self?.tabBarController?.navigationController?.viewControllers = [startLoginFactory.startLogin()]
        }
    }
    
}
