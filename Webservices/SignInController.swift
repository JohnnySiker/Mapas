//
//  SignInController.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 26/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import Alamofire

class SignInController: UIViewController {

    @IBOutlet weak var tf_nombre: UITextField!
    @IBOutlet weak var tf_correo: UITextField!
    @IBOutlet weak var tf_pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registrar(sender: AnyObject) {
        
        let params = ["nombre":tf_nombre.text!, "correo":tf_correo.text!, "pass":tf_pass.text!]
        Alamofire.request(.GET, "http://checkin.clipp.mx/registrarUsuario.php", parameters:params)
            .responseJSON { response in
            print(response.description)
        }
        
    }    
}

















