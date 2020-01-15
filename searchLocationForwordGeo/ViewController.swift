//
//  ViewController.swift
//  searchLocationForwordGeo
//
//  Created by Student P_04 on 16/12/19.
//  Copyright © 2019 Felix ITs. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var searchText: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let geo = CLGeocoder()
        geo.geocodeAddressString(searchText.text!) { (placeMarks, error) in
            let placeMark = placeMarks?.first
            let coordinate = placeMark?.location?.coordinate
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
          
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate!, span: span)
            self.mapView.setRegion(region, animated: true)
            let title = placeMark?.name
            annotation.title = title
            self.mapView.addAnnotation(annotation)
            
        }
       return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

