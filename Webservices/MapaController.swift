//
//  MapaController.swift
//  Webservices
//
//  Created by Jonathan Velazquez on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import MapKit

class MapaController: UIViewController,MKMapViewDelegate {

    
    @IBOutlet weak var mapa: MKMapView!
    
    var places = [Lugar]()
    var Pines:[MKPointAnnotation] = []
    var selectedPlace:Lugar?
    
    
    ////
    var mapLocation:CLLocation!
    var mapAddress:String!
    var isAddingPlace:Bool = false
    @IBOutlet weak var nextButton: CircleButton!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapa.delegate = self
        generatePines()
        setupView()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let sPlace = selectedPlace {
            let center = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: sPlace.latitud, longitude: sPlace.longitud ), 1000, 1000)
            mapa.setRegion(center, animated: true)
        }else {
            let center = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 19.3248466, longitude: -99.162640), 10000, 10000)
            mapa.setRegion(center, animated: true)
        }
        
    }
    
    
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        selectedPlace = nil
    }
    
    func setupView(){
        if isAddingPlace {
            nextButton.alpha = 1
            centerImage.alpha = 1
            addressLabel.alpha = 1
        }else{
            nextButton.alpha = 0
            centerImage.alpha = 0
            addressLabel.alpha = 0
        }
    }
    
    
    func generatePines(){
        for p in places{
            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: p.latitud, longitude: p.longitud)
            pointAnnotation.title = p.nombre
            pointAnnotation.subtitle = p.descripcion
            Pines.append(pointAnnotation)
        }
        mapa.addAnnotations(Pines)
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView()
        annotationView.annotation = annotation
        annotationView.image = UIImage(named: "Pin")
        annotationView.canShowCallout = true
        annotationView.enabled = true
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        mapLocation = CLLocation(latitude: mapView.camera.centerCoordinate.latitude, longitude: mapView.camera.centerCoordinate.longitude)
        
        if isAddingPlace {
            CLGeocoder().reverseGeocodeLocation(mapLocation, completionHandler: {
                (placemarks,error) -> Void in
                
                if error != nil {
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = placemarks![0] as CLPlacemark
                    self.mapAddress = self.getLocationInfo(pm)
                    self.addressLabel.text = self.mapAddress
                }
                
            })
        }
    }
    
    
    func getLocationInfo(placemark:CLPlacemark) -> String{
        var str = ""
        if(placemark.name != nil){
            str += "\(placemark.name! as String)"
        }
        if(placemark.postalCode != nil){
            str += " \(placemark.postalCode! as String)"
        }
        if(placemark.country != nil){
            str += " \(placemark.country! as String)"
        }
        if(placemark.administrativeArea != nil){
            str += ",\(placemark.administrativeArea! as String)"
        }
        if(placemark.locality != nil){
            str += ",\(placemark.locality! as String)"
        }
        return str
    }
    
    
    @IBAction func completeAdding(sender: CircleButton) {
        let addPlaceController = self.storyboard?.instantiateViewControllerWithIdentifier("AddPlaceController") as! AddPlaceController
        
        self.navigationController?.pushViewController(addPlaceController, animated: true)
    }

}
