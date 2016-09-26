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
    @IBOutlet weak var myImagenTickOK_KO: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Redondeamos las esquinas de las imágenes
        self.makeItRounded()
        
        myImagenTickOK_KO.hidden = true
    }
    
    func makeItRounded() {
        self.myImagenSimbolo.layer.masksToBounds = true
        self.myImagenSimbolo.layer.cornerRadius = 10
        self.myImagenTickOK_KO.layer.masksToBounds = true
        self.myImagenTickOK_KO.layer.cornerRadius  = 10
    }


    
}
