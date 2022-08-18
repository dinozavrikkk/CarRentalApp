
import UIKit

final class ContainerViewController: UIViewController {
    
    private let driverVC: DriverProfileViewController
    private var menuVC: UIViewController?
    private var isMove = false
    
    init(driverDataProvider: DriverDataProvider) {
        self.driverVC = DriverProfileViewController(driverDataProvider: driverDataProvider)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDriverViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBarItem()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        configureNavigationItem()
    }

}

//MARK: Configure Controllers
private extension ContainerViewController {

    func configureDriverViewController() {
        addChild(driverVC)
        view.addSubview(driverVC.view)
        driverVC.view.frame = view.bounds
        driverVC.didMove(toParent: self)
    }

    func configureMenuViewController() {
        if menuVC == nil {
            menuVC = MenuViewController() 
            addChild(menuVC ?? UIViewController())
            view.insertSubview(menuVC?.view ?? UIView(), at: 0)
            menuVC?.view.frame = view.bounds
            menuVC?.didMove(toParent: self)
        }
    }

    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            VCAnimation.animationShowMenu { 
                    self.driverVC.view.frame.origin.x = self.driverVC.view.frame.size.width - 220
            }
        } else {
            VCAnimation.animationHideMenu {
                    self.driverVC.view.frame.origin.x = 0
            }
        }
    }

}

//MARK: Click processing, Configure buttons
private extension ContainerViewController {
    
    func configureNavigationItem() {
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .done, target: self, action: nil)
    }
    
    func configureTabBarItem() {
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(menuButtonTapped))
        tabBarController?.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc private func menuButtonTapped() {
        configureMenuViewController()
        isMove.toggle()
        showMenuViewController(shouldMove: isMove)
        if !isMove {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                self.tabBarController?.tabBar.isHidden = self.isMove
            }
        } else {
            tabBarController?.tabBar.isHidden = isMove
        }
    }
    
}

