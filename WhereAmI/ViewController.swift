//
//  ViewController.swift
//  WhereAmI
//
//  Created by JSU SOSS Mac on 6/25/15.
//  Copyright (c) 2015 JSU SOSS. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var previousPoint:CLLocation?
    private var totalMovementDistance:CLLocationDistance = 0
    
    @IBOutlet var latitudeLabel:UILabel!
    @IBOutlet var longitudeLabel:UILabel!
    @IBOutlet var horizontalAccuracyLable:UILabel!
    @IBOutlet var altitudeLabel:UILabel!
    @IBOutlet var verticalAccuracyLabel:UILabel!
    @IBOutlet var distanceTraveledLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus){
            println("Authorization status changed to \(status.rawValue)")
            switch status {
            case .Authorized, .AuthorizedWhenInUse:
                locationManager.startUpdatingLocation()
                
            default:
                locationManager.stopUpdatingLocation()
            }
    }

    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!) {
            let errorType = error.code == CLError.Denied.rawValue
                ?"Access Denied": "Error \(error.code)"
            let alertController = UIAlertController(title: "Location Manager Error",
                message: errorType, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel,
                handler: { action in})
    }
}

