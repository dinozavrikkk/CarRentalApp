
import UIKit

class MenuViewController: UIViewController {
    
    private let menuView = MenuView()
    private var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        
        menuView.delegateGoOutButton = self
    }
    
}

extension MenuViewController: ExitingTheApp {
    
    func goOutButtonTapped() {
        Alerts.getGoOutAlert { [weak self] in
            let factory = Factory()
            self?.userDefault.setValue(false, forKey: "isLogin")
            
            self?.tabBarController?.navigationController?.viewControllers = [factory.startLogin()]
        }
    }
    
}
