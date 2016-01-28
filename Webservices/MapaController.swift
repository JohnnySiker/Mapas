//
//  MapaController.swift
//  Webservices
//
//  Created by Jonathan Velazquez on 28/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.


import UIKit
import MapKit

class MapaController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa: MKMapView!
    
    var lugares = [Lugar]()
    
    var pines = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapa.delegate = self
        addAnnotation()
        
        
    }

    func addAnnotation(){
        for l in lugares {
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: l.latitud, longitude: l.longitud)
            pin.title = l.nombre
            pin.subtitle = l.descripcion
            
            pines.append(pin)
        }
        mapa.addAnnotations(pines)
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKAnnotationView()
        annotationView.annotation = annotation
        annotationView.image = UIImage(named: "Pin")
        annotationView.canShowCallout = true
        annotationView.enabled = true
        
        return annotationView
    
    }
    

}

























