//
//  SYBCollectionViewCell.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/8/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var myImagenSimbolo: UIImageView!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Redondeamos las esquinas de las imágenes
        self.makeItRounded()
        
    }
    
    func makeItRounded() {
        self.myImagenSimbolo.layer.masksToBounds = true
        self.myImagenSimbolo.layer.cornerRadius = 10
    }


    
}
