//
//  LugarCell.swift
//  Webservices
//
//  Created by Aldo Antonio Martinez Avalos on 27/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit

class LugarCell: UITableViewCell {

    @IBOutlet weak var iv_lugar: UIImageView!
    @IBOutlet weak var lbl_nombre: UILabel!
    @IBOutlet weak var lbl_descripcion: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
