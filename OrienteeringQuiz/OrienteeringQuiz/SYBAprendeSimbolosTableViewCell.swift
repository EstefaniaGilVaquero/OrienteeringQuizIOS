//
//  SYBAprendeSimbolosTableViewCell.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 26/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBAprendeSimbolosTableViewCell: UITableViewCell {


    @IBOutlet weak var myDescripcionAprende: UILabel!
    @IBOutlet weak var myImagenSimboloAprende: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
