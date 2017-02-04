//
//  RankingTableViewCell.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 29/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenUsuario: UIImageView!
    @IBOutlet weak var nombreUsuarioLBL: UILabel!
    @IBOutlet weak var clubUsuarioLBL: UILabel!
    @IBOutlet weak var puntuacionUsuarioLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagenUsuario.layer.borderWidth = 0.5
        imagenUsuario.layer.borderColor = UIColor.white.cgColor
        imagenUsuario.layer.cornerRadius = 50
        
        imagenUsuario.layer.masksToBounds = false
        imagenUsuario.clipsToBounds = true
    }

}
