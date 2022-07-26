
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

        let factory = Factory()
        let navVC = UINavigationController(rootViewController: factory.startApp())
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    func startLogin() {

        let factory = Factory()
        let navigationController = UINavigationController(rootViewController: factory.startLogin())
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

