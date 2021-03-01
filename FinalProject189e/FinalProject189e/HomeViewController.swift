//
//  HomeViewController.swift
//  FinalProject189e
//
//  Created by Yizeng on 2/27/21.
//

import UIKit
import Mapbox

class HomeViewController: UIViewController, MGLMapViewDelegate {
    
    @IBOutlet weak var centerUser: UIButton!
    @IBOutlet var mapView: MGLMapView!
    
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
    
    /**
     This function is used to handle the single tap on the map
     which will generate a pop up for user
     click to switch to SIGN page
     */
    @IBAction func centerToUser(_ sender: Any) {
        mapView.setCenter(mapView.userLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 38.537, longitude: -121.754), zoomLevel: 14, animated: true)
    }
    @objc func handleMapTap(sender: UITapGestureRecognizer) {
        let spot = sender.location(in: mapView)
        let features = mapView.visibleFeatures(at: spot)
        let spot_name = features.first?.attribute(forKey: "name") as? String
        print(spot_name ?? "no name")
    }
}
