//
//  mapVC.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/15/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

import UIKit
import MapKit
import CoreLocation

protocol sendingMapAddressDelegate: class {
    func sendAddress(_ address:String)
}

class mapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapAddressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var addressDelegate: sendingMapAddressDelegate!
    var address: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManagerConfig(for: locationManager)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            addressDelegate.sendAddress(address)
       
    }
    

   
}



extension mapVC:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let centerLocation = locations.last?.coordinate else{return}
        let center = CLLocationCoordinate2D(latitude: centerLocation.latitude, longitude: centerLocation.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkUserLocationAuthorization(for: locationManager)
    }
}


extension mapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
       let center = getMapCenterCoordinate()
        var address = ""
         CLGeocoder().reverseGeocodeLocation(center) {(placeMarks, error) in
            if error != nil{
                address = "Sorry!! There is an error"
                return
            }else{
                guard let placeMark = placeMarks?.first else{
                    address = "Sorry!! Address is not Available"
                    return }
                if let street = placeMark.thoroughfare{
                    address += "\(street)"
                }
                if let city = placeMark.locality{
                    address += ", \(city)"
                }
                if let country = placeMark.country{
                    address += ", \(country)"
                }
                self.mapAddressLabel.text = "Location: \(address)"
                self.address = address
            }
        }
    }
}



extension mapVC{
    
    // configure location manager
    // --------------------------
    func locationManagerConfig(for manager: CLLocationManager){
        manager.delegate = self
        checkUserLocationAuthorization(for: manager)
        
        
    }
    
    // checking for location authorization
    // -----------------------------------
    func checkUserLocationAuthorization(for manager: CLLocationManager){
        switch(CLLocationManager.authorizationStatus()){
        case .notDetermined :
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse, .authorizedAlways:
            manager.desiredAccuracy = kCLLocationAccuracyBest
            mapView.showsUserLocation = true
            regionZoom(for: locationManager)
            manager.startUpdatingLocation()
            break
        case .denied:
            // show alart that the service is not available
            break
        case .restricted:
            break
        default:
            print("location manager framework got some new updates")
            break
        }
        
    }
    
    // configure map view zoom
    // -----------------------
    func regionZoom(for manager: CLLocationManager){
        guard let coordinate = manager.location?.coordinate else {return}
        
        let region = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
    
    // converting map center to CLlocation
    func getMapCenterCoordinate()->CLLocation{
        let lat = mapView.centerCoordinate.latitude
        let lon = mapView.centerCoordinate.longitude
        return CLLocation(latitude: lat, longitude: lon)
    }
    
}
//guard let placeMark = placeMarks?.first else{
//    address = "Sorry!! Address is not Available"
//    return }
//if let street = placeMark.thoroughfare{
//    address += "\(street)"
//}
//if let area = placeMark.administrativeArea{
//    address += ", \(area)"
//}
//if let city = placeMark.locality{
//    address += ", \(city)"
//}
//if let country = placeMark.country{
//    address += ", \(country)"
//}


