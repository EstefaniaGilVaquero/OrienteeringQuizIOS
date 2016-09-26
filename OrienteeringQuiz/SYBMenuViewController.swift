//
//  SYBMenuViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBMenuViewController: UIViewController {
    
//    *** Primary color:
//    
//    shade 0 = #F67729 = rgb(246,119, 41) = rgba(246,119, 41,1) = rgb0(0.965,0.467,0.161)
//    shade 1 = #FFA56E = rgb(255,165,110) = rgba(255,165,110,1) = rgb0(1,0.647,0.431)
//    shade 2 = #FF914C = rgb(255,145, 76) = rgba(255,145, 76,1) = rgb0(1,0.569,0.298)
//    shade 3 = #D8590A = rgb(216, 89, 10) = rgba(216, 89, 10,1) = rgb0(0.847,0.349,0.039)
//    shade 4 = #B14401 = rgb(177, 68,  1) = rgba(177, 68,  1,1) = rgb0(0.694,0.267,0.004)
//    

    let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
    let menuColo2 = UIColor(red: 1, green: 0.647, blue: 0.431, alpha: 1)
    let menuColo3 = UIColor(red: 1, green: 0.569, blue: 0.298, alpha: 1)
    let menuColo4 = UIColor(red: 0.847, green: 0.349, blue: 0.039, alpha: 1)
    let menuColo5 = UIColor(red: 0.694, green: 0.267, blue: 0.004, alpha: 1)
    
    //    *** Secondary color (1):
    //
    //    shade 0 = #F6C629 = rgb(246,198, 41) = rgba(246,198, 41,1) = rgb0(0.965,0.776,0.161)
    //    shade 1 = #FFDD6E = rgb(255,221,110) = rgba(255,221,110,1) = rgb0(1,0.867,0.431)
    //    shade 2 = #FFD54C = rgb(255,213, 76) = rgba(255,213, 76,1) = rgb0(1,0.835,0.298)
    //    shade 3 = #D8A80A = rgb(216,168, 10) = rgba(216,168, 10,1) = rgb0(0.847,0.659,0.039)
    //    shade 4 = #B18801 = rgb(177,136,  1) = rgba(177,136,  1,1) = rgb0(0.694,0.533,0.004)
    
    let menuColo6 = UIColor(red: 0.965, green: 0.776, blue: 0.161, alpha: 1)
    let menuColo7 = UIColor(red: 1, green: 0.867, blue: 0.431, alpha: 1)
    let menuColo8 = UIColor(red: 1, green: 0.835, blue: 0.298, alpha: 1)
    let menuColo9 = UIColor(red: 0.847, green: 0.659, blue: 0.039, alpha: 1)
    let menuColo10 = UIColor(red: 0.694, green: 0.533, blue: 0.004, alpha: 1)
    
    
    

    @IBOutlet weak var buttonAprendeSimbolos: UIButton!
    @IBOutlet weak var buttonQuizMixto: UIButton!
    @IBOutlet weak var buttonSymbolosMapa: UIButton!
    @IBOutlet weak var buttonSymbolosDescripcion: UIButton!
    @IBOutlet weak var buttonRanking: UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Estilo botones
        
        buttonAprendeSimbolos.backgroundColor = menuColo1
        buttonSymbolosMapa.backgroundColor = menuColo2
        buttonSymbolosDescripcion.backgroundColor = menuColo3
        buttonQuizMixto.backgroundColor = menuColo4
        buttonRanking.backgroundColor = menuColo5
        
//        buttonAprendeSimbolos.titleEdgeInsets.left = 80; // add left padding.
//        buttonSymbolosMapa.titleEdgeInsets.left = 80; // add left padding.
//        buttonSymbolosDescripcion.titleEdgeInsets.left = 80; // add left padding.
//        buttonQuizMixto.titleEdgeInsets.left = 80; // add left padding.
//        buttonRanking.titleEdgeInsets.left = 80; // add left padding.
        
        //Estilo background
        view.backgroundColor = menuColo1

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Identificar el segue por el que estamos pasando
        if segue.identifier == "simbolosMapa" {
            //Crear el objeto que representa el VC que recibe una vista DESTINO
            if let destinationVC = segue.destinationViewController as? SYBQuizsViewController {
                destinationVC.tituloNavigationController = "Quiz Simbolos Mapa"
                destinationVC.numeroImagenes = 5
            }
        }else if segue.identifier == "simbolosDescripcion" {
            //Crear el objeto que representa el VC que recibe una vista DESTINO
            if let destinationVC = segue.destinationViewController as? SYBQuizsViewController {
                destinationVC.tituloNavigationController = "Quiz Simbolos Descripcion"
                destinationVC.numeroImagenes = 5
                destinationVC.nombrePlist = "SimbolosDescripcion"
            }
        }
    }
    
    
    

}
