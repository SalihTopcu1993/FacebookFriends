//
//  DetailViewController.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var result : ResponseItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        setMap()
    }
    

    func setMap() {
        let initialLocation = CLLocation(latitude: result?.home?.latitude ?? 0.0, longitude: result?.home?.longitude ?? 0.0)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
          mapView.setRegion(coordinateRegion, animated: true)

        }
        centerMapOnLocation(location: initialLocation)
        // show artwork on map
        let artwork = Artwork(title: result?.name ?? "",
                              locationName: result?.name ?? "",
                              discipline: result?.name ?? "",
          coordinate: CLLocationCoordinate2D(latitude: result?.home?.latitude ?? 0.0, longitude: result?.home?.longitude ?? 0.0))
        mapView.addAnnotation(artwork)
    }

}

