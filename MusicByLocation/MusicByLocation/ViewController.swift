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
    let iTunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            self.musicRecommendations.text = names?.joined(separator: ", /n")
        }
    }
}
