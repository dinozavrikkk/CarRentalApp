
import UIKit

class ContainerViewController: UIViewController {
    
    private let driverVC = DriverProfileViewController()
    private var menuVC: UIViewController!
    private var isMove = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDriverViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(menuButtonTapped))
        tabBarController?.navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .done, target: self, action: nil)
    }

}

extension ContainerViewController {

    private func configureDriverViewController() {
        addChild(driverVC)
        view.addSubview(driverVC.view)
        driverVC.view.frame = view.bounds
        driverVC.didMove(toParent: self)
    }

    private func configureMenuViewController() {
        if menuVC == nil {
            menuVC = MenuViewController()
            addChild(menuVC)
            view.insertSubview(menuVC.view, at: 0)
            menuVC.view.frame = view.bounds
            menuVC.didMove(toParent: self)
        }
    }

    private func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            VCAnimation.animationShowMenu { 
                {
                    self.driverVC.view.frame.origin.x = self.driverVC.view.frame.size.width - 220
                }
            }
        } else {
            VCAnimation.animationHideMenu {
                {
                    self.driverVC.view.frame.origin.x = 0
                }
            }
        }
    }

}

extension ContainerViewController {
    
    @objc private func menuButtonTapped() {
        configureMenuViewController()
        isMove = !isMove
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

