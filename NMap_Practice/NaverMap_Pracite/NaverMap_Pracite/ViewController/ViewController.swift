//
//  ViewController.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//

import UIKit
import CoreLocation
import NMapsMap
import RxSwift
import RxCocoa

class ViewController: BaseViewController  {
    let viewModel = CenterViewModel()
    var locationManager:CLLocationManager!
    var centers: [Center] = []

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
    
    // MARK: - 내 위치로 카메라 이동
    func moveCamera() {
        currentLocation()
        let cameraUpdate = NMFCameraUpdate(scrollTo:  NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0), zoomTo: 17)
        mapView.moveCamera(cameraUpdate)
    }
    
    
    
    func getCenterList() {
        viewModel.requestCenterList(page: 1, perPage: 284) { data in // 뷰 모델에 있는 리퀘스트 쏀터 리스트 사용 성공시 넘어오는 데이터 data 안에 넣어줌
            // 넘어온 data는 CenterListVO타입의 배열
            self.centers = data.data // 전역에 선언한 Center 배열 타입의 centers에 data에 넣어서 넘어온 CenterListVO안의 Center 배열을 넣어준다
            for (_, center) in self.centers.enumerated() { // 인덱스 번호만큼 반복/  Centers의 값에서 원하는값을 뽑아 사용 한다
                // 센터이름으로 마커 찍는 메서드를 실행 넘어온 data의 수 만큼 마커를 찍는다 센터의 이름과 위도, 경도를 넣는다
                self.centerMarkers(title:center.centerName, lat: Double(center.lat) ?? 0.0, lng: Double(center.lng) ?? 0.0)
                    }
                
        } failure: { error in
            let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
// MARK: - 센터이름으로 마커 찍기 (마커에 필요한 정보는 이름, 위도,경도)
    func centerMarkers(title: String, lat: Double, lng: Double) {
        // 정보창
        let infoWindow = NMFInfoWindow()
        // 정보창에 데이터
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        // 센터 이름
        dataSource.title = title
        
        // 정보창 마커에 데이터를 데이터 소스를 선언
        infoWindow.dataSource = dataSource
        
        // 정보창 위치 표시
        infoWindow.position = NMGLatLng(lat: lat , lng: lng)
        
        
        infoWindow.minZoom = 12
        self.mapView.minZoomLevel = 12
        // 센터 위치 맵에 표시
        infoWindow.mapView = self.mapView
        
    }
    
    func currentLoactionOverray() {
        // 내위치 표시
        mapView.positionMode = .direction
    }
}

extension ViewController: CLLocationManagerDelegate {
    
}
