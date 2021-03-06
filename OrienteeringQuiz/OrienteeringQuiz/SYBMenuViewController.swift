//
//  SYBMenuViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit
import Parse
import PKHUD

class SYBMenuViewController: UIViewController {
    
    var simbolosArrayMapa = [simbolosModelo]()
    var simbolosArrayDescripcion = [simbolosModelo]()
    var simbolosArrayMix = [simbolosModelo]()
    var clasificacionArraySingle = [clasificacionModelo]()
    var clasificacionArrayClub = [clasificacionModelo]()
    var myUserClasifPosition = 0
    
    //Imagenes menu
    @IBOutlet weak var menuAprendeIMG: UIImageView!
    @IBOutlet weak var menuMapaIMG: UIImageView!
    @IBOutlet weak var menuDescripcionIMG: UIImageView!
    @IBOutlet weak var menuQuizIMG: UIImageView!
    @IBOutlet weak var menuRankingIMG: UIImageView!
    
    
    let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
    let menuColo2 = UIColor(red: 1, green: 0.647, blue: 0.431, alpha: 1)
    let menuColo3 = UIColor(red: 1, green: 0.569, blue: 0.298, alpha: 1)
    let menuColo4 = UIColor(red: 0.847, green: 0.349, blue: 0.039, alpha: 1)
    let menuColo5 = UIColor(red: 0.694, green: 0.267, blue: 0.004, alpha: 1)
    
    let menuColo6 = UIColor(red: 0.965, green: 0.776, blue: 0.161, alpha: 1)
    let menuColo7 = UIColor(red: 1, green: 0.867, blue: 0.431, alpha: 1)
    let menuColo8 = UIColor(red: 1, green: 0.835, blue: 0.298, alpha: 1)
    let menuColo9 = UIColor(red: 0.847, green: 0.659, blue: 0.039, alpha: 1)
    let menuColo10 = UIColor(red: 0.694, green: 0.533, blue: 0.004, alpha: 1)
    
    @IBOutlet weak var btnMenuButtom: UIBarButtonItem!
    @IBOutlet weak var buttonAprendeSimbolos: UIButton!
    @IBOutlet weak var buttonQuizMixto: UIButton!
    @IBOutlet weak var buttonSymbolosMapa: UIButton!
    @IBOutlet weak var buttonSymbolosDescripcion: UIButton!
    @IBOutlet weak var buttonRanking: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            btnMenuButtom.target = revealViewController()
            btnMenuButtom.action = #selector(SWRevealViewController.revealToggle(_:))
        }

        buttonAprendeSimbolos.backgroundColor = menuColo1
        buttonSymbolosMapa.backgroundColor = menuColo2
        buttonSymbolosDescripcion.backgroundColor = menuColo3
        buttonQuizMixto.backgroundColor = menuColo4
        buttonRanking.backgroundColor = menuColo5
        
        menuAprendeIMG.layer.masksToBounds = true
        menuAprendeIMG.layer.cornerRadius = 10
        menuMapaIMG.layer.masksToBounds = true
        menuMapaIMG.layer.cornerRadius = 10
        menuDescripcionIMG.layer.masksToBounds = true
        menuDescripcionIMG.layer.cornerRadius = 10
        menuQuizIMG.layer.masksToBounds = true
        menuQuizIMG.layer.cornerRadius = 10
        menuRankingIMG.layer.masksToBounds = true
        menuRankingIMG.layer.cornerRadius = 10
    
        
        //Estilo background
        view.backgroundColor = menuColo1
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        HUD.show(.progress)
//        //Recupero la clasificacion
//        self.obtenerClasificacion()
//        HUD.flash(.systemActivity, delay: 2.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identificar el segue por el que estamos pasando
        if let destinationVC = segue.destination as? SYBQuizsViewController {
            if segue.identifier == "simbolosMapa" {
                destinationVC.tituloNavigationController = "Simbolos Mapa"
                destinationVC.numeroImagenes = 12
                //destinationVC.simbolosArrayGuay = simbolosArrayMapa
            }else if segue.identifier == "simbolosDescripcion" {
                destinationVC.tituloNavigationController = "Simbolos Descripcion"
                destinationVC.numeroImagenes = 12
                //destinationVC.simbolosArrayGuay = simbolosArrayDescripcion
            }else if segue.identifier == "simbolosMix" {
                destinationVC.tituloNavigationController = "Quiz Mix"
                destinationVC.numeroImagenes = 2
                //destinationVC.simbolosArrayGuay = simbolosArrayMix
            }
        }else if let destinationVC = segue.destination as? AprendeSimbolosViewController {
            if segue.identifier == "simbolosAprende" {
                destinationVC.tituloNavigationController = "Aprende los Simbolos"
                //destinationVC.simbolosArrayGuay = simbolosArrayMix
            }
        }else if let destinationVC = segue.destination as? RankingViewController {
            if segue.identifier == "clasificacion" {
                destinationVC.tituloNavigationController = "Clasificacion"
//                destinationVC.clasificacionArraySingle = clasificacionArraySingle
//                destinationVC.clasificacionArrayClub = clasificacionArrayClub
//                destinationVC.myUserClasifPosition = myUserClasifPosition
            }
        }
    }

//    func obtenerSimbolos(){
//        
//        //Miro el idioma del sistema, si es diferente de español, lo pongo en ingles
//        var idioma = Locale.current.languageCode
//        if (idioma != "es"){
//            idioma = "en"
//        }
//
//        let querySimbolos = PFQuery(className:"Simbolos")
//        querySimbolos.whereKey("idioma", equalTo:idioma)
//        querySimbolos.findObjectsInBackground {
//            (objects: [PFObject]?, error: Error?) -> Void in
//            
//            if error == nil {
//                // The find succeeded.
//                print("Se han leido \(objects!.count) simbolos en idioma \(idioma)")
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        print(object.objectId!)
//                        
//                        //Obtenemos el simbolo .png               
//                        let simbolo = simbolosModelo(pTipo: (object["tipo"] as! String?)!, pImagen: (object["imagen"] as! PFFile?)!, pDescripcionCorta: object["descripcionCorta"] as! String, pDescripcionLarga: object["descripcionLarga"] as! String, pIsExpanded: false)
//                        
//                        if(simbolo.tipo == "mapa"){
//                            self.simbolosArrayMapa.append(simbolo)
//                        }else if(simbolo.tipo == "descripcion"){
//                            self.simbolosArrayDescripcion.append(simbolo)
//                        }
//                        self.simbolosArrayMix.append(simbolo)
//                   }
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!._userInfo)")
//            }
//        }
//        
//    }
    
//    func obtenerClasificacion(){
//        
//        //Usuario actual
//        let currentUser = PFUser.current()
//        
//        //Limpio clasificacion para cargarla de nuevo
//        clasificacionArraySingle.removeAll()
//        clasificacionArrayClub.removeAll()
//        
//        let querySimbolos = PFQuery(className:"Clasificacion")
//        querySimbolos.addDescendingOrder("puntuacion")
//        querySimbolos.findObjectsInBackground {
//            (objects: [PFObject]?, error: Error?) -> Void in
//            
//            if error == nil {
//                // The find succeeded.
//                print("Se han leido \(objects!.count) clasificaciones")
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        print(object.objectId!)                        
//                        let nombreUsuario = (object["nombreUsuario"] as! String?)!
//                        let puntuacion = (object["puntuacion"] as! Int?)!
//                        let club = (object["club"] as! String?)!
//                        
//                        let query = PFQuery(className: "ImagenPerfil")
//                        query.whereKey("nombreUsuario", equalTo: object["nombreUsuario"])
//                        query.getFirstObjectInBackground {
//                            (objectImagen: PFObject?, error: Error?) -> Void in
//                            
//                            if error != nil || objectImagen == nil {
//                                print("Error al obtener imagen de usuario")
//                                
//                            } else {
//                                print("Guardo imagen de usuario en clasificacionArray")
//                                let userImageFile = objectImagen?["ficheroImagen"] as! PFFile
//                                
//                                userImageFile.getDataInBackground(block: { (imageData, errorImageData) in
//                                    if errorImageData == nil{
//                                        if let imageDataDesempaquetado = imageData{
//                                            
//                                            //Metemos clasificacion en el array
//                                            let clasificacionSingle = clasificacionModelo(pPuntuacion: puntuacion, pNombreUsuario: nombreUsuario, pClub: club, pImagenProfile: UIImage(data: imageDataDesempaquetado)!)
//                                            
//                                            self.clasificacionArraySingle.append(clasificacionSingle)
//                                            
//                                            if(nombreUsuario == currentUser?.username){
//                                                //guardo la posicion en la que se encuentra mi usuario
//                                                self.myUserClasifPosition = self.clasificacionArraySingle.count - 1
//                                            }
//                                            
//                                            self.calcularPuntuacionClubes(clasificacionSingle: clasificacionSingle)
//                                        }
//                                    }
//                                })
//                            }
//                        }
//                    }
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!._userInfo)")
//            }
//        }
//    }
//    
//    func calcularPuntuacionClubes(clasificacionSingle : clasificacionModelo){
//        
//        var clubEncontrado = false
//        
//        let clasificacionClubes = clasificacionModelo(pPuntuacion: clasificacionSingle.puntuacion!, pNombreUsuario: "", pClub: clasificacionSingle.club!, pImagenProfile: #imageLiteral(resourceName: "club"))
//        
//        if (clasificacionArrayClub.isEmpty){            
//            clasificacionArrayClub.append(clasificacionClubes)
//        }else{
//            for i in 0..<clasificacionArrayClub.count {
//                let elemento = clasificacionArrayClub[i]
//                if (elemento.club?.uppercased().contains(clasificacionClubes.club!.uppercased()))!{
//                    clasificacionArrayClub[i].puntuacion = elemento.puntuacion! + clasificacionClubes.puntuacion!
//                    
//                    clubEncontrado = true
//                    break
//                }
//            }
//            
//            if (!clubEncontrado){
//                clasificacionArrayClub.append(clasificacionClubes)
//            }
//        }
//    }
}
