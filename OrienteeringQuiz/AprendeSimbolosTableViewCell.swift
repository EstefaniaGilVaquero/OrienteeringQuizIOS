//
//  AprendeSimbolosTableViewCell.swift
//  OrienteeringQuiz
//
//  Created by CICE on 28/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class AprendeSimbolosTableViewCell: UITableViewCell {

    @IBOutlet weak var myDescripcionLargaAprendeSimbolos: UILabel!
    @IBOutlet weak var myDescripcionAprendeSimbolos: UILabel!
    @IBOutlet weak var myImagenAprendeSimbolos: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
