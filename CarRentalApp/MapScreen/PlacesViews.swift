
import Foundation
import MapKit

final class PlacesViews: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let places = newValue as? PlacesAnnotation else {
                return
            }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            image = places.markerImage
        }
    }
    
}

