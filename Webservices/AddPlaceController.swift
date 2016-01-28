//
//  AddPlaceController.swift
//  Webservices
//
//  Created by Jonathan Velazquez on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit

class AddPlaceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
