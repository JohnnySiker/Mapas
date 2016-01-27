//
//  LoginController.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 26/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

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
    
    @IBAction func login(sender: AnyObject) {
        let params = ["correo":tf_correo.text!, "pass":tf_pass.text!]
        Alamofire.request(.GET, "http://checkin.clipp.mx/login.php", parameters:params)
            .responseJSON { response in
                
            print(response.description)
            print(response.data)
        
            do{
                //Dictionary<String,AnyObject>
                let json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: .AllowFragments)
                print(json["code"] as! Int)
                print(json["msj"] as! String)
                if let code = json["code"]{
                    if(code as! Int) == 200{
                        //Éxito
                        print("Éxito")
                        
                        let checkInController = self.storyboard?.instantiateViewControllerWithIdentifier("CheckInController")
                        
                        self.presentViewController(checkInController!, animated: true, completion: nil)
                    }else{
                        //Error :c
                        print("Error")
                    }
                }
            
            }catch{
                print("Error al convertir a JSON")
            }
        }
    }
}









