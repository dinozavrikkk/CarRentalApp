
import Foundation
import UIKit
import MapKit
import Contacts

final class PlacesAnnotation: NSObject , MKAnnotation {
    
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, locationName: String?, discipline: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }
    
    init?(feature: MKGeoJSONFeature) {
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let propertiesData = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String: Any]
        else {
            return nil
        }
        title = properties["title"] as? String
        locationName = properties["location"] as? String
        discipline = properties["discipline"] as? String
        coordinate = point.coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    var markerImage: UIImage {
        guard let disc = discipline else {
            return UIImage(named: "whiteCar")!
        }
        switch disc {
        case "BMW": return UIImage(named: "bmw")! 
        case "Lamborghini": return UIImage(named: "lambo")!
        case "Audi": return UIImage(named: "audiPIN")!
        case "Ferrari": return UIImage(named: "ferrariPIN")!
        case "Jaguar": return UIImage(named: "jaguarPIN")!
        case "Lexus": return UIImage(named: "lexusPIN")!
        case "Mercedes-Benz": return UIImage(named: "mers")!
        case "Porsche": return UIImage(named: "porshe")!
        default:
            return UIImage(named: "whiteCar")!
        }
    }
    
}
