//
//  ClasificacionModelo.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 29/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit
import Parse

class clasificacionModelo: NSObject {
    
    var puntuacion :Int?
    var nombreUsuario : String?
    var club : String?
    var imagenProfile : UIImage?
    
    init(pPuntuacion : Int, pNombreUsuario : String, pClub : String, pImagenProfile : UIImage) {
        
        self.puntuacion = pPuntuacion
        self.nombreUsuario = pNombreUsuario
        self.club = pClub
        self.imagenProfile = pImagenProfile
        super.init()
    }
}
