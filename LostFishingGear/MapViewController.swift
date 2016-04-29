//
//  MapViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SwiftyJSON
import Alamofire

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationMgr = CLLocationManager()
    var mapRegion: MKCoordinateRegion?
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // Setting API key once for whole session
    let manager = Alamofire.Manager.sharedInstance
    let headers = ["Accept": "text/plain"]
    let urlString = "https://entanglerwrangler.herokuapp.com/map"

    
    @IBAction func mapFilterButtonPressed(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            //filter by lost gear
            print("hi")
        case 1:
            //filter by found gear
            print("bye")
        default:
            break;
        }    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationMgr.delegate = self
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.startUpdatingLocation()
        getCoords()
        
        manager.request(.GET, urlString, headers: headers).responseJSON{ response in
        print("got here")
            if let value = response.result.value {
                
                let json = JSON(value)
                print(json)
                print("---------------------------------")
                
                // use SwiftyJSON
                for (index,subJson):(String, JSON) in json {
                    
                    if let latitude = subJson["latitude"].double{
                        
                        let latitude = subJson["latitude"].double
                        print(latitude)
                        
                        let longitude = subJson["longitude"].double
                        print(longitude)
                        
                        //pinpointing every location on a map
                        let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                        print("*****")
                        print(coordinate)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = coordinate
                        
                        self.mapView.addAnnotation(annotation)
                        self.mapView.setRegion(self.mapRegion!, animated: true)
                        //end pinpointing every location on a map
                        
                    } else{
                        print(subJson["latitude"].error)
                    }
                    
                
                }
            }
        }
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getCoords(){
        

        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.last
        let userCenter = CLLocationCoordinate2DMake(userLocation!.coordinate.latitude, userLocation!.coordinate.longitude)
        
        // what part of the map is going to show up in the view
        // how zoomed in or zoomed out of our center do we want to be in
        //smaller the delta number, the more zoomed in it will be (1.25 probably see entire city)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        mapRegion = MKCoordinateRegion(center: userCenter, span: mapSpan)
        
        //        mapView.setRegion(mapRegion, animated: true)
        //        locationMgr.stopUpdatingHeading()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
