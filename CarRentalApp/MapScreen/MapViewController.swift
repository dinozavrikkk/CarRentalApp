
import UIKit

final class MapViewController: UIViewController {
    
    private let mapView = MapView()
    
    override func loadView() {
        view = mapView

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Alerts.getMessageAboutCarsAlert()
    }

}
