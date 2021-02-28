//
//  ViewController.swift
//  FinalProject189e
//
//  Created by Zheng Wang on 2/28/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 38.537, longitude: -121.754)
        mapView.centerToLocation(initialLocation)
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
