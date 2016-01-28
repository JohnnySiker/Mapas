//
//  CheckInController.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CheckInController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableLugares: UITableView!
    var lugares:[Lugar] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getLugares()
        
        tableLugares.delegate = self
        tableLugares.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lugares.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableLugares.dequeueReusableCellWithIdentifier("LugarCell") as! LugarCell
        cell.lbl_nombre.text = lugares[indexPath.row].nombre
        cell.lbl_descripcion.text = lugares[indexPath.row].descripcion
        cell.iv_lugar.image = lugares[indexPath.row].imagen
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mapaView = self.storyboard?.instantiateViewControllerWithIdentifier("MapaController") as! MapaController
        mapaView.places = lugares
        mapaView.selectedPlace = lugares[indexPath.row]
        self.navigationController?.pushViewController(mapaView, animated: true)
    }
   
    /*
    Esta función consulta los lugares de una url y los guarda en un objeto
    */
    func getLugares(){
        Alamofire.request(.GET, "http://checkin.clipp.mx/getPlaces.php")
            .responseJSON{ response in
            print(response.description)
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: .AllowFragments)
                print(json)
                
                let places = json["places"] as! [Dictionary <String,AnyObject>]
                for p in places{
                    let nombre = p["nombre"] as! String
                    let desc = p["descripcion"] as! String
                    let latitud = (p["latitud"] as! NSString).doubleValue
                    let longitud = (p["longitud"] as! NSString).doubleValue
                    
                    let urlImagen = p["url"] as! String
                    
                    let l = Lugar(nombre: nombre, descripcion: desc,latitud: latitud,longitud: longitud)
                    
                    self.getPlaceImage(l, url: urlImagen)
                    
                    //self.lugares.append(Lugar(nombre: nombre, descripcion: desc))
                }
                //self.tableLugares.reloadData()
            }catch{
                print("Error al leer el JSON")
            }
        }
    }
    
    /*
    Esta función recibe un objeto de tipo lugar, descarga la imagen de la url. Posteriormente
    agrega la imágen descargada al objeto de tipo lugar y la agrega al arreglo lugares.
    */
    func getPlaceImage(lugar:Lugar, url:String){
        Alamofire.request(.GET, url).responseImage{ response in
            if let image = response.result.value {
                lugar.imagen = image
            }
            self.lugares.append(lugar)
            self.tableLugares.reloadData()
        }
    }
    
    
    
    @IBAction func showMapa(sender: UIBarButtonItem) {
        let mapaView = self.storyboard?.instantiateViewControllerWithIdentifier("MapaController") as! MapaController
        mapaView.places = lugares
        self.navigationController?.pushViewController(mapaView, animated: true)
    }
    
    
    @IBAction func addPlace(sender: CircleButton) {
        let mapaView = self.storyboard?.instantiateViewControllerWithIdentifier("MapaController") as! MapaController
        mapaView.places = lugares
        mapaView.isAddingPlace = true
        self.navigationController?.pushViewController(mapaView, animated: true)
    }
    
    
}



















