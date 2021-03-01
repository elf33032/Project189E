//
//  HomeViewController.swift
//  FinalProject189e
//
//  Created by Yizeng on 2/27/21.
//

import UIKit
import Mapbox
import MapboxSearch
import MapboxGeocoder

class HomeViewController: UIViewController, MGLMapViewDelegate {
    
    @IBOutlet weak var centerUser: UIButton!
    @IBOutlet var mapView: MGLMapView!
    
    let geocoder = Geocoder.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(mapView.userLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 38.537, longitude: -121.754), zoomLevel: 14, animated: false)
        mapView.delegate = self
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(sender:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)
        mapView.showsUserLocation = true
        
    }
    
    @IBAction func centerToUser(_ sender: Any) {
        mapView.setCenter(mapView.userLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 38.537, longitude: -121.754), zoomLevel: 14, animated: true)
    }
    
    /**
     This function is used to handle the single tap on the map
     which will generate a pop up for user
     click to switch to SIGN page
     */
    @objc func handleMapTap(sender: UITapGestureRecognizer) {
        let spot = sender.location(in: mapView)
        let features = mapView.visibleFeatures(at: spot)
        if features.first != nil {
            //print(features.first?.coordinate.latitude ?? "sb")
            //print(features.first?.coordinate.longitude ?? "sb")
            let query_coordinate = String((features.first?.coordinate.latitude)!) + ", " + String((features.first?.coordinate.longitude)!)
            //print(query_coordinate)
            let options = ReverseGeocodeOptions(coordinate: features.first!.coordinate)
            let task = geocoder.geocode(options) { (placemarks, attribution, error) in
                guard let placemark = placemarks?.first else {
                    return
                }
                print(placemark.formattedName)
                print(placemark.name)
            }
        }
    }
}
