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
        // Initialization code
        
        imagenUsuario.layer.cornerRadius = imagenUsuario.bounds.width / 2.0
        imagenUsuario.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
