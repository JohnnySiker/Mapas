//
//  Lugar.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import Foundation
import UIKit

class Lugar{
    var imagen:UIImage!
    var nombre:String!
    var descripcion:String!
    var latitud:Double!
    var longitud:Double!
    
    
    init(nombre:String,descripcion: String,latitud:Double,longitud:Double){
        self.nombre = nombre
        self.descripcion = descripcion
        self.latitud = latitud
        self.longitud = longitud
    }
    
    func setImagen(imagen:UIImage){
        self.imagen = imagen
    }
    
}
