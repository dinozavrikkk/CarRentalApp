
import Foundation
import UIKit
import MapKit
import CoreLocation

final class MapView: UIView {
    
    private let map: MKMapView = {
       let mv = MKMapView()
        mv.showsUserLocation = true
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    private lazy var userLocationButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(userLocationButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var places: [PlacesAnnotation] = []
    private let locationManager = CLLocationManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubvies()
        setupConstraints()
        showsTheLocationOfTheUser()
        setupDelegate()
        loadInitialData()
        map.addAnnotations(places)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubvies() {
        [map, userLocationButton].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            map.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            map.topAnchor.constraint(equalTo: self.topAnchor),
            map.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])

        NSLayoutConstraint.activate([
            userLocationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            userLocationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            userLocationButton.heightAnchor.constraint(equalToConstant: 40),
            userLocationButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    private func setupDelegate() {
        map.delegate = self
        map.register(PlacesViews.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    private func showsTheLocationOfTheUser() {
        if CLLocationManager.locationServicesEnabled() == true {
            if locationManager.authorizationStatus == .restricted || locationManager.authorizationStatus == .denied || locationManager.authorizationStatus == .notDetermined {
                
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            Alerts.getLocationIsDisabledAlert()
        }
    }
    
    private func loadInitialData() {
        guard
            let fileName = Bundle.main.url(forResource: "Places", withExtension: "geojson"),
            let placesData = try? Data(contentsOf: fileName)
        else {
            return
        }
        do {
            let features = try MKGeoJSONDecoder()
                .decode(placesData)
                .compactMap { $0 as? MKGeoJSONFeature }
            let validWorks = features.compactMap(PlacesAnnotation.init)
            places.append(contentsOf: validWorks)
        }
        catch {
            print(error)
        }
    }
    
    private func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.setRegion(region, animated: true)
    }
    
    @objc private func userLocationButtonTapped() {
        let coordinate = map.userLocation.coordinate
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: true)
    }
    
}

//MARK: CLLocationManagerDelegate
extension MapView: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        manager.stopUpdatingLocation()
        render(location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Alerts.getLocationIsDisabledAlert()
        print("Unable to access your current location")
    }

}

//MARK: MKMapViewDelegate
extension MapView: MKMapViewDelegate {
  
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let places = view.annotation as? PlacesAnnotation else {
            return
        }
        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        places.mapItem?.openInMaps(launchOptions: launchOption)
    }
    
}
