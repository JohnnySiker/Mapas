//
//  ViewController.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 26/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var btn_login:UIButton!
    var btn_registro:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_login = UIButton(frame: CGRect(x: 20, y: 20, width: 200, height: 70))
        btn_login.translatesAutoresizingMaskIntoConstraints = false
        btn_login.addTarget(self, action: "hacerLogin", forControlEvents: .TouchUpInside)
        
        btn_registro = UIButton(frame: CGRect(x: 220, y: 20, width: 200, height: 70))
        btn_registro.translatesAutoresizingMaskIntoConstraints = false
        btn_registro.addTarget(self, action: "hacerRegistro", forControlEvents: .TouchUpInside)
        
        btn_login.setTitle("Login", forState: .Normal)
        btn_registro.setTitle("Registro", forState: .Normal)
        
        btn_login.backgroundColor = UIColor.greenColor()
        btn_registro.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(btn_login)
        self.view.addSubview(btn_registro)
        
        //Constraints de Boton Login
        self.view.addConstraint(NSLayoutConstraint(item: btn_login, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: btn_login, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: btn_login, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: self.view.frame.width/2))
        
        //Constraints de Botón Registro
        self.view.addConstraint(NSLayoutConstraint(item: btn_registro, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: btn_registro, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: btn_registro, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: self.view.frame.width/2))
        
    }
    
    func hacerLogin(){
        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController")
        
        self.navigationController?.pushViewController(loginView!, animated: true)
    }

    func hacerRegistro(){
        let registroView = self.storyboard?.instantiateViewControllerWithIdentifier("SignInController")
        
        self.navigationController?.pushViewController(registroView!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



















