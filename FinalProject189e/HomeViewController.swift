//
//  HomeViewController.swift
//  FinalProject189e
//
//  Created by Yizeng on 2/27/21.
//

import UIKit
import Mapbox
import MapboxSearch

class HomeViewController: UIViewController, MGLMapViewDelegate, SearchEngineDelegate {
    @IBOutlet weak var centerUser: UIButton!
    @IBOutlet var mapView: MGLMapView!
    let searchEngine = SearchEngine()
    
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
        searchEngine.delegate = self
        searchEngine.query = "Mapbox"
        
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
        if features.first != nil {
            print(features.first ?? "sb")
            if features.first?.attribute(forKey: "name") != nil {
                print(features.first?.attribute(forKey: "name") ?? "sb")
            }
        }
    }
    
    func resultsUpdated(searchEngine: SearchEngine) {
       
    }
    
    func resolvedResult(result: SearchResult) {
    
    }
    
    func searchErrorHappened(searchError: SearchError) {
    
    }
    
    
}
