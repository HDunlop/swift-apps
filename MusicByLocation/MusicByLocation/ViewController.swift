//
//  ViewController.swift
//  MusicByLocation
//
//  Created by ManLikeMe on 26/02/2020.
//  Copyright © 2020 SingularBro. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let iTunesAdaptor = ITunesAdaptor()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: {
                (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.iTunesAdaptor.getArtists(search: firstPlacemark.locality) { (artists) in
                            let names = artists?.map { return $0.artistName }
                            self.musicRecommendations.text = names?.joined(separator: ", /n")
                        }
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
    func getLocationBreakdown(placemark: CLPlacemark) -> String {
        return """
            Street: \(placemark.thoroughfare ?? "None")
            Area: \(placemark.administrativeArea ?? "None")
            Country: \(placemark.country ?? "None")
            """
    }
}
