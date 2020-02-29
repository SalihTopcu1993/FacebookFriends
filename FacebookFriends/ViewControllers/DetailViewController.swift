//
//  DetailViewController.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var result : ResponseItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        setMap()
        setUI()
    }
//MARK: - FUNCTIONS
    func setUI(){
        self.title = "Detail"
        guard let value = result else { return }
        profileImageView.kf.setImage(with: URL(string: value.picture!))
        nameLabel.text = value.name
        addressLabel.text = value.address
        registeredLabel.text = value.registeredDate
    }
    
}
//MARK: - MAPKIT
extension DetailViewController: MKMapViewDelegate {
    
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
//MARK: - TABLEVIEW
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        result?.favoriteFriends?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = result?.favoriteFriends?[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}

