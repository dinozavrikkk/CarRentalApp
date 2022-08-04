
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userDefault = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
//        userDefault.setValue(false, forKey: "isLogin")
        let isLogin = userDefault.object(forKey: "isLogin") as? Bool ?? false
        
        if isLogin {
            startApp()
        } else {
            startLogin()
        }
        
    }
    
    func startApp() {

        let startAppFactory = StartAppFactory()
        let navVC = UINavigationController(rootViewController: startAppFactory.startApp())
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    func startLogin() {

        let startLoginFactory = StartLoginFactory()
        let navigationController = UINavigationController(rootViewController: startLoginFactory.startLogin())
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

