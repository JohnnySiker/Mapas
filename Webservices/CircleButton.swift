//
//  CircleButton.swift
//  Webservices
//
//  Created by Jonathan Velazquez on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width/2
    }
    
    
}
