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
    
    init(nombre:String,descripcion: String){
        self.nombre = nombre
        self.descripcion = descripcion
    }
    
    func setImagen(imagen:UIImage){
        self.imagen = imagen
    }
    
}
