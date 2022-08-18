
import UIKit

final class MapViewController: UIViewController {
    
    private let mapView = MapView()
    private var isShowUp = true
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isShowUp {
            Alerts.getMessageAboutCarsAlert()
            isShowUp.toggle()
        }
        
    }

}
