//
//  HomeViewController.swift
//  FinalProject189e
//
//  Created by Yizeng on 2/27/21.
//

import UIKit
import Mapbox

class HomeViewController: UIViewController {
    
    @IBOutlet var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 38.537, longitude: -121.754), zoomLevel: 14, animated: false)
    }
}
