//
//  simbolosModelo.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 14/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit
import Parse

class simbolosModelo: NSObject {
    
    var tipo :String?
    var imagen : PFFile?
    var descripcionCorta : String
    var descripcionLarga : String?
    var isExpanded: Bool
    
    init(pTipo : String, pImagen : PFFile, pDescripcionCorta : String, pDescripcionLarga : String, pIsExpanded : Bool) {
        
        self.tipo = pTipo
        self.imagen = pImagen
        self.descripcionCorta = pDescripcionCorta
        self.descripcionLarga = pDescripcionLarga
        self.isExpanded = pIsExpanded
        super.init()
    }
}
