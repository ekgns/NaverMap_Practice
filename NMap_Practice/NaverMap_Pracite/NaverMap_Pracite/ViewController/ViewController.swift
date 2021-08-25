//
//  ViewController.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//

import UIKit
import CoreLocation
import NMapsMap

class ViewController: UIViewController  {
    
    var locationManager:CLLocationManager!
    
    let marker = NMFMarker()
    
    let viewModel = CenterViewModel()
    var centers: [Center] = []
    
    var centerLat: Double = 0.0
    var centerLng: Double = 0.0
    
    var lat: Double?
    var lng: Double?
    
    
    @IBOutlet weak var mapView: NMFMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        moveCamera()
        currentLoactionOverray()
        getCenterList()
        
    }
    
    @IBAction func myLoactionButtonTapped(_ sender: UIButton) {
        moveCamera()
    }
    
    func currentLocation() {
        let coor = locationManager.location?.coordinate
        lat = coor?.latitude
        lng = coor?.longitude

    }
    
    func moveCamera() {
        currentLocation()
        let cameraUpdate = NMFCameraUpdate(scrollTo:  NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0), zoomTo: 17)
        mapView.moveCamera(cameraUpdate)
    }
    
    func getCenterList() {
        viewModel.requestCenterList(page: 1, perPage: 1) { data in
            self.centers = data.data
                print("================================")
            for (index, number) in self.centers.enumerated() {
                print("\(index+1): \(number.lat)")
                self.centerLat = Double(number.lat) ?? 0.0
                self.centerLng = Double(number.lng) ?? 0.0
                self.marker.position = NMGLatLng(lat: self.centerLat, lng: self.centerLng)
                self.marker.mapView = self.mapView
                print("\(self.marker)")
                    }
                print("================================")
//            }
        } failure: { error in
            let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func currentLoactionOverray() {
        mapView.positionMode = .direction
    }
}

extension ViewController: CLLocationManagerDelegate {
    
}
