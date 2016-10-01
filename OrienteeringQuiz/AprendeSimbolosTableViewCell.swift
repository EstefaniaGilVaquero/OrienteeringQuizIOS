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
    
    @IBOutlet weak var myView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        contentView.backgroundColor = menuColo1
        
        
        myView.layer.masksToBounds = true
        myView.layer.cornerRadius = 15
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
