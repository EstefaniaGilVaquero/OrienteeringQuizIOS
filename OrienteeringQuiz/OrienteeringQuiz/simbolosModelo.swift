//
//  simbolosModelo.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 14/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit

class simbolosModelo: NSObject {
    
    var tipo :String?
    var idImagen : Int?
    var imagen : UIImage?
    var descripcionCorta : String
    var descripcionLarga : String?
    
    init(pTipo : String, pIdImagen : Int, pImagen : UIImage, pDescripcionCorta : String, pDescripcionLarga : String) {
        
        self.tipo = pTipo
        self.idImagen = pIdImagen
        self.imagen = pImagen
        self.descripcionCorta = pDescripcionCorta
        self.descripcionLarga = pDescripcionLarga
        super.init()
    }
}
