//
//  MapaController.swift
//  Webservices
//
//  Created by Jonathan Velazquez on 28/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import MapKit

class MapaController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mapa.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
